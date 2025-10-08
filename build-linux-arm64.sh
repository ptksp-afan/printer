#!/bin/bash

# Hentikan eksekusi jika ada error
set -e

pwd="$(pwd)"
package="./node_modules/@grandchef/node-printer"

echo "📦 Membangun @iamtomcat/printer untuk Linux arm64..."

cp ./node-printer.binding.gyp "$package/binding.gyp"

cd "$package"
npx node-gyp rebuild --target=38.1.2 --dist-url=https://electronjs.org/headers --arch=arm64

cd "$pwd"

mkdir -p build/linux-arm64
cp "$package/build/Release/node_printer.node" build/linux-arm64

echo "✅ Build selesai! File hasil: build/linux-arm64/node_printer.node"
