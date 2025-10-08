@echo off
setlocal enabledelayedexpansion

echo 📦 Membangun modul native untuk Windows x64...

set "PWD=%cd%"
set "PACKAGE=.\node_modules\@iamtomcat\printer"

cd /d "%PACKAGE%"

:: Jalankan node-gyp rebuild untuk Electron target 38.1.2 dengan arsitektur x64
npx node-gyp rebuild --target=38.1.2 --dist-url=https://electronjs.org/headers --arch=x64

cd /d "%PWD%"

:: Buat folder hasil build
if not exist build\win-x64 mkdir build\win-x64

:: Salin hasil build
copy "%PACKAGE%\build\Release\node_printer.node" "build\win-x64\" >nul

echo ✅ Build selesai! File hasil: build\win-x64\node_printer.node
endlocal
