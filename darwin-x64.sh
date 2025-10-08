#!/bin/bash

# Hentikan eksekusi jika terjadi error
set -e

# Simpan direktori kerja saat ini
pwd="$(pwd)"
package="./node_modules/@iamtomcat/printer"

echo "📦 Membangun modul native untuk Darwin x64..."

# Pindah ke direktori package
cd "$package"

# Jalankan proses build menggunakan node-gyp untuk Electron target 38.1.2 dan arsitektur x64
npx node-gyp rebuild --target=38.1.2 --dist-url=https://electronjs.org/headers --arch=x64

# Kembali ke direktori awal
cd "$pwd"

# Buat folder output
mkdir -p build/darwin-x64

# Salin hasil build
cp "$package/build/Release/node_printer.node" build/darwin-x64/

echo "✅ Build selesai! File hasil: build/darwin-x64/node_printer.node"
