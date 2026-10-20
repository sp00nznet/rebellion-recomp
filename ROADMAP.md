# Roadmap

## Done

- Catalog (34,425 functions) and lift (0 errors) of `REBEXE.EXE`.
- Boots from the entry point through the CRT, its registry lookups,
  DirectDraw (640x480x8) and DirectSound.
- The LucasArts intro movie plays (Smacker, drawn into the window with GDI).

## Now: past the intros

- **Intro speed.** A 40-second run is still in the LucasArts logo, and the
  recording captured only 65 frames. Check whether the movie or the capture is
  slow. Skipping with Escape is the other way through.
- **The main menu.** The first DirectDraw primary surface, and a palette set
  on it, are still ahead. Watch for `CreateSurface ... primary` in the log.
- **The host's comments** still describe Fallout Tactics in places. Its
  README notes are in `docs/` there, and need their own here.

## Then

- A new game against the AI: the galaxy map (strategy), and then a battle
  (tactical, Direct3D Retained Mode through the shipped `d3drm.dll`).
- Sound: DirectSound effects and the voice DLLs; the music.
- Saving and loading.
- The presenter (`--run` without `--headless`): the game in a window of its
  own, scaled.
- A play-test script, the way Fallout Tactics and Civilization III have one.

## Later

- Multiplayer: DirectPlay, which Windows 10 and 11 need enabled
  (`DirectPlayEnable.bat` in the Steam install).
- Higher resolutions; the game is fixed at 640x480.
