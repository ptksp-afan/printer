#!/bin/bash

# Hentikan eksekusi jika ada error
set -e

pwd="$(pwd)"
package="./node_modules/@iamtomcat/printer"

echo "📦 Membangun @iamtomcat/printer untuk Linux x64..."

cd "$package"
npx node-gyp rebuild --target=38.1.2 --dist-url=https://electronjs.org/headers --arch=x64

cd "$pwd"

mkdir -p build/linux-x64
cp "$package/build/Release/node_printer.node" build/linux-x64

echo "✅ Build selesai! File hasil: build/linux-x64/node_printer.node"
