@echo off
@REM First find the number of timepoints.
dir *_z001.webp /b /on | find /i ".webp" /c > numT.txt
set /p len=<numT.txt
@REM Clean up the temp file.
del numT.txt
setlocal EnableDelayedExpansion
FOR /l %%N in (1, 1, !len!) do (
    set "n=00%%N"
    set "n=!n:~-3!"
    tar.exe -a -cf time_!n!.zip *_t!n!_*.webp
)
