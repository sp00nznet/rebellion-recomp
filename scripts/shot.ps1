# Run the recompiled game in the presenter for a while and save its window.
#   scripts\shot.ps1 [-Wait 20] [-Out work\shot.png] [-Original]
param([int]$Wait = 20, [string]$Out = "work\shot.png", [switch]$Original)
$ErrorActionPreference = "Stop"
Set-Location (Split-Path $PSScriptRoot -Parent)
Add-Type -AssemblyName System.Drawing
Add-Type @"
using System; using System.Runtime.InteropServices;
public class W {
  [DllImport("user32.dll")] public static extern bool PrintWindow(IntPtr h, IntPtr dc, uint f);
  [DllImport("user32.dll")] public static extern bool GetWindowRect(IntPtr h, out RECT r);
  [StructLayout(LayoutKind.Sequential)] public struct RECT { public int L, T, R, B; }
}
"@
Get-Process rebellion -ErrorAction SilentlyContinue | Stop-Process -Force
$a = @("--run", "--watchdog", "$($Wait + 30)")
if ($Original) { $a += "--original" }
$p = Start-Process build\rebellion.exe -ArgumentList $a -PassThru -RedirectStandardError work\shot.log -RedirectStandardOutput work\shot.out
Start-Sleep -Seconds $Wait
$p.Refresh()
if ($p.HasExited) { "exited early with $($p.ExitCode)"; exit 1 }
$h = $p.MainWindowHandle
$r = New-Object W+RECT; [void][W]::GetWindowRect($h, [ref]$r)
$bmp = New-Object Drawing.Bitmap ($r.R - $r.L), ($r.B - $r.T)
$g = [Drawing.Graphics]::FromImage($bmp); $dc = $g.GetHdc()
[void][W]::PrintWindow($h, $dc, 2)
$g.ReleaseHdc($dc); $g.Dispose(); $bmp.Save((Join-Path (Get-Location) $Out)); $bmp.Dispose()
"$Out $($r.R - $r.L)x$($r.B - $r.T) title=$($p.MainWindowTitle)"
Stop-Process -Id $p.Id -Force
