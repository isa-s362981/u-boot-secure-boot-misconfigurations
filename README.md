# U-Boot Secure Boot Misconfiguration Analysis

University team project developed for the **Cybersecurity for Embedded Systems** course at **Politecnico di Torino (a.y. 2025/26)**.

## Overview

This project studies how a Secure Boot implementation can still be compromised when the bootloader is incorrectly configured, even when strong cryptographic primitives are used correctly.

The experiments were performed with **U-Boot** in **QEMU-emulated ARM environments**, using both the generic `virt` machine and a Raspberry Pi 3 target. The project first established a working baseline in which signed FIT images were accepted and unsigned images were rejected, and then investigated several misconfiguration-driven attack paths.

## Main Topics

- U-Boot Secure Boot and FIT images
- RSA-2048 signatures and SHA-256 hashing
- Chain of Trust analysis
- ARM/QEMU emulation
- Device Tree configuration
- Bootloader attack-surface analysis
- Secure configuration and hardening

## Demonstrated Scenarios

1. **Firmware reconnaissance** — showing how secrets embedded in firmware can be exposed by static analysis.
2. **Signature-verification bypass** — demonstrating how unrestricted execution paths can bypass the verified boot flow.
3. **Environment-variable hijacking** — showing how a mutable `bootcmd` can redirect the boot sequence.
4. **Alternate-storage loading** — showing how enabled peripheral-loading commands can introduce unverified payloads into memory.

## Repository Structure

```text
.
├── README.md
├── AUTHORS.md
├── .gitignore
├── report/
│   └── U-Boot-Secure-Boot-Report.pdf
├── config/
│   └── fit.its
├── scripts/
│   ├── setup_environment.sh
│   ├── build_uboot.sh
│   ├── generate_keys.sh
│   ├── create_fit_image.sh
│   └── run_qemu.sh
├── experiments/
│   ├── 01_firmware_reconnaissance.md
│   ├── 02_signature_bypass.md
│   ├── 03_environment_hijack.md
│   └── 04_external_storage_bypass.md
├── docs/
│   └── architecture.md
└── results/
    └── screenshots/
```

## Quick Start

The scripts in this repository mirror the commands documented in the project report. They are intended for an isolated academic lab environment.

Typical workflow:

```bash
bash scripts/setup_environment.sh
bash scripts/build_uboot.sh
bash scripts/generate_keys.sh
bash scripts/create_fit_image.sh
bash scripts/run_qemu.sh
```

> **Note:** Some commands require distribution-specific packages or paths. Review the scripts before running them on your system.

## Security Finding

The central result of the project is that cryptographic strength alone does not guarantee Secure Boot. A system can still lose its Chain of Trust when unrestricted execution commands, mutable boot configuration, exposed debug access, or unsafe peripheral-loading paths remain enabled.

## Hardening Ideas Discussed in the Report

- Remove unrestricted execution commands from production builds.
- Protect or eliminate interactive bootloader access.
- Make critical environment variables immutable.
- Disable unnecessary peripheral and filesystem-loading commands.
- Use a hardware Root of Trust for the first verification step.
- Add lifecycle protections such as anti-rollback mechanisms.

## Tools

- U-Boot
- QEMU
- ARM cross-compilers
- OpenSSL
- `mkimage`
- Device Tree Compiler tools (`dtc`, `fdtput`, `fdtdump`)
- Linux shell utilities

## Authors

This was a **team project**. See [AUTHORS.md](AUTHORS.md).

## Disclaimer

This repository documents an academic cybersecurity project carried out in isolated emulated environments for educational and defensive research. Do not apply these techniques to systems you do not own or have explicit authorization to test.
