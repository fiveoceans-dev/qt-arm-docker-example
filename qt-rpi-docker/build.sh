#!/usr/bin/env bash

set -e

echo "==> Cleaning..."
rm -rf build
mkdir -p build
mkdir -p output

echo "==> Building Docker image..."

if ! docker image inspect qt-rpi-builder >/dev/null 2>&1; then
    docker build -t qt-rpi-builder .
fi

echo "==> Building Qt application..."

docker run --rm \
    -v "$(pwd):/workspace" \
    -w /workspace \
    qt-rpi-builder \
    bash -c "
        cd build &&
        qmake ../app/app.pro &&
        make -j\$(nproc) &&
        cp qt-rpi-app ../output/
    "

echo

if [ -f output/qt-rpi-app ]; then
    echo "Build completed successfully."
    echo "Binary:"
    ls -lh output/qt-rpi-app
else
    echo "Build failed."
    exit 1
fi