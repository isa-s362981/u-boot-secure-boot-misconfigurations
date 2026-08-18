#!/usr/bin/env bash
set -euo pipefail

UBOOT_DIR="${UBOOT_DIR:-$HOME/u-boot}"

if [ ! -d "$UBOOT_DIR/.git" ]; then
    git clone --branch v2023.10 --depth 1 https://source.denx.de/u-boot/u-boot.git "$UBOOT_DIR"
fi

cd "$UBOOT_DIR"

make qemu_arm_defconfig

# Intentionally mixed security posture used for the academic experiment.
scripts/config --enable CONFIG_FIT
scripts/config --enable CONFIG_FIT_SIGNATURE
scripts/config --enable CONFIG_RSA
scripts/config --enable CONFIG_FIT_VERBOSE
scripts/config --set-val CONFIG_BOOTDELAY 3
scripts/config --enable CONFIG_AUTOBOOT_KEYED
scripts/config --set-str CONFIG_AUTOBOOT_PROMPT "Loading kernel..."
scripts/config --set-str CONFIG_AUTOBOOT_STOP_STR "skey"
scripts/config --disable CONFIG_AUTOBOOT_ENCRYPTION

make -j"$(nproc)"

echo "U-Boot built in: $UBOOT_DIR"
