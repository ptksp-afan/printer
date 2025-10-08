@echo off
setlocal enabledelayedexpansion

echo 📦 Membangun modul native untuk Windows 32-bit...

set "PWD=%cd%"
set "PACKAGE=.\node_modules\@grandchef\node-printer"

copy "node-printer.binding.gyp" "%PACKAGE%\binding.gyp" >nul

cd /d "%PACKAGE%"

:: Jalankan node-gyp rebuild untuk Electron target 38.1.2 dengan arsitektur ia32 (32-bit)
npx node-gyp rebuild --target=38.1.2 --dist-url=https://electronjs.org/headers --arch=ia32

cd /d "%PWD%"

:: Buat folder hasil build
if not exist build\win-ia32 mkdir build\win-ia32

:: Salin hasil build
copy "%PACKAGE%\build\Release\node_printer.node" "build\win-ia32\" >nul

echo ✅ Build selesai! File hasil: build\win-ia32\node_printer.node
endlocal
