@echo off
setlocal enabledelayedexpansion
dir /b *.webp > origFiles.txt
for %%f in (*.webp) do (echo -frame %%f +0 >> inputArgs.txt)
echo -o output.webp >> inputArgs.txt & webpmux.exe inputArgs.txt


set /A Counter=1
for /f %%i in (origFiles.txt) do (
    set Var=00!Counter!
    set Var=!Var:~-3!
    ren %%i img_!Var!.webp
    set /A Counter+=1
)

ffmpeg -f image2 -framerate 12 -i img_%%03d.webp -c:v libvpx-vp9 -crf 32 -b:v 0 output.webm

REM for /f %%i in (origFiles.txt) do del %%i
del inputArgs.txt && del origFiles.txt