# 01 — Firmware Reconnaissance

## Objective

Demonstrate why secrets embedded directly in firmware should not be treated as confidential.

## Lab Context

The project intentionally configured an autoboot stop string in U-Boot. The compiled firmware was then inspected with standard static-analysis tooling.

## Example Command

```bash
strings u-boot.bin | grep -B 2 -A 2 "Loading kernel..."
```

## Observation

The configured stop string was visible in the firmware image, showing that compiling a secret into a binary does not encrypt or protect it.

## Defensive Takeaway

Production firmware should not rely on hardcoded plaintext secrets. Debug access should be removed or protected by an appropriate authenticated mechanism.
