#!/usr/bin/env bash

# This script must be run as root

set -e
set -x

apt-get update && \
    apt-get install -y libboost-dev libboost-filesystem-dev libboost-program-options-dev libelf-dev lcov cmake git pkg-config g++ sudo

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
cd "$SCRIPT_DIR"/..

git submodule init
git submodule update
.github/scripts/build-libbpf.sh

cmake -B build -DCMAKE_BUILD_TYPE=Debug && \
cmake --build build --config Debug

cmake --build build --target test -- || true

build/bin/bpf_conformance_runner --test_file_directory tests --plugin_path build/bin/libbpf_plugin
