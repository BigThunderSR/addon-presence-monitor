#!/bin/bash
set -ev

ROOT_DIR=$(dirname "$(readlink -f "$0")")

echo "Running local build test."

docker run -it --rm --privileged --name "presence-monitor" \
    -v ~/.docker:/root/.docker \
    -v "${ROOT_DIR}":/docker \
    hassioaddons/build-env:latest \
    --target "presence-monitor" \
    --tag-latest \
    --push \
    --all \
    --author "BigThunderSR" \
    --doc-url "https://github.com/BigThunderSR/hassio-presence-monitor" \
    --parallel
