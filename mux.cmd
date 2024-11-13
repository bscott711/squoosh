@echo off
dir /b *.webp >origFiles.txt
for %%f in (*.webp) do (echo -frame %%f +0 >> inputArgs.txt)
echo -o output.webp >> inputArgs.txt & webpmux.exe inputArgs.txt
