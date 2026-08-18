# 04 — Alternate Storage Path

## Objective

Study the security impact of leaving peripheral-loading and filesystem commands enabled in a production bootloader.

## Lab Observation

The project used a QEMU-backed storage path to show that an unverified payload could be copied into RAM through an enabled peripheral interface and then passed to an unrestricted execution path.

## Defensive Takeaway

If removable or alternate storage is not required in production, the corresponding drivers and filesystem-loading commands should be disabled. If field updates are required, the update path should enforce cryptographic verification.
