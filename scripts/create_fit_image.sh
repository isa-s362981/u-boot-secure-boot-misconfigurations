#!/usr/bin/env bash
set -euo pipefail

UBOOT_DIR="${UBOOT_DIR:-$HOME/u-boot}"
KEY_DIR="${KEY_DIR:-keys}"
FIT_ITS="${FIT_ITS:-config/fit.its}"
DTB="${DTB:-qemu-virt.dtb}"

printf 'SECURE BOOT KERNEL RUNNING\n' > dummy_kernel.bin

qemu-system-arm \
    -M virt \
    -nographic \
    -machine dumpdtb="$DTB" \
    >/dev/null 2>&1 || true

mkimage -f "$FIT_ITS" -K "$DTB" -k "$KEY_DIR" -r signed-kernel.itb

fdtdump "$DTB" | grep -A 5 "signature" || true

echo "Created signed FIT image: signed-kernel.itb"
