# Changelog

## [Unreleased]

### Added
- First catalog and lift of `REBEXE.EXE`: 34,425 functions, 0 errors.
- `run_lift.py` (from Fallout Tactics'), a `native32` host (from Fallout
  Tactics' and Red Alert 2's), `build.cmd`, `scripts/shot.ps1`.
- The game's registry key, answered by the host: every location the game
  folder, so a copied install gets past "CD Not Found".
- Activation of the window the game shows; 8-bit palette-indexed modes;
  frames captured from the window while there is no primary surface.
- The LucasArts intro plays. This needed pcrecomp #120 (`TerminateThread`
  and native32's machine lock).
