# 02 — Signature-Verification Bypass

## Objective

Study the difference between a verified boot path and an unrestricted execution path in an intentionally vulnerable U-Boot configuration.

## Baseline

The project first confirmed that the signed FIT image was accepted while an unsigned image was rejected by the normal verified boot path.

## Lab Observation

The report shows that unrestricted execution functionality can bypass the FIT-image verification flow when such functionality remains enabled in an insecure configuration.

## Defensive Takeaway

Production bootloaders should follow the principle of least functionality. Debug or legacy execution paths that do not enforce the same verification policy should be removed from production builds.

## Authorization Note

The experiment was performed in an isolated QEMU environment as part of a university cybersecurity laboratory.
