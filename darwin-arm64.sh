#!/bin/bash

# Hentikan eksekusi jika terjadi error
set -e

# Simpan direktori kerja saat ini
pwd="$(pwd)"
package="./node_modules/@grandchef/node-printer"

echo "📦 Membangun modul native untuk Darwin arm64..."

cp ./node-printer.binding.gyp "$package/binding.gyp"

# Pindah ke direktori package
cd "$package"

# Jalankan proses build menggunakan node-gyp untuk Electron target 45.1.0 dan arsitektur arm64
npx node-gyp rebuild --target=45.1.0 --dist-url=https://electronjs.org/headers --arch=arm64

# Kembali ke direktori awal
cd "$pwd"

# Buat folder output
mkdir -p build/darwin-arm64

# Salin hasil build
cp "$package/build/Release/node_printer.node" build/darwin-arm64/

echo "✅ Build selesai! File hasil: build/darwin-arm64/node_printer.node"
