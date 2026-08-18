#!/usr/bin/env bash
set -euo pipefail

# Academic lab setup helper.
# Choose the package-manager command appropriate for your distribution.

if command -v apt >/dev/null 2>&1; then
    sudo apt update
    sudo apt install -y \
        gcc-arm-linux-gnueabi \
        build-essential \
        bison flex \
        libssl-dev \
        qemu-system-arm \
        device-tree-compiler \
        u-boot-tools \
        openssl git make gcc
elif command -v dnf >/dev/null 2>&1; then
    sudo dnf install -y \
        qemu-system-arm \
        gcc-arm-linux-gnu \
        uboot-tools \
        openssl git make gcc bison flex \
        openssl-devel gnutls-devel swig \
        ncurses-devel pkgconfig dtc
else
    echo "Unsupported package manager. Install the dependencies manually."
    exit 1
fi
