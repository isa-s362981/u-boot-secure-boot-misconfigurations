#!/usr/bin/env bash
set -euo pipefail

UBOOT_BIN="${UBOOT_BIN:-$HOME/u-boot/u-boot.bin}"

if [ ! -f "$UBOOT_BIN" ]; then
    echo "U-Boot binary not found: $UBOOT_BIN"
    echo "Set UBOOT_BIN or run scripts/build_uboot.sh first."
    exit 1
fi

qemu-system-arm \
    -M virt \
    -nographic \
    -bios "$UBOOT_BIN"
