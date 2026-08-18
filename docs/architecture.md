# Architecture and Threat Model

## Simplified Boot Flow

```text
BootROM / Root of Trust
        |
        v
      U-Boot
        |
        v
   Signed FIT image
        |
        v
      Kernel
```

In a correctly enforced Secure Boot chain, each stage verifies the integrity and authenticity of the next stage before transferring execution.

## Security Model Used in the Project

The project intentionally combined valid cryptographic mechanisms with insecure configuration choices so that the difference between **cryptographic capability** and **policy enforcement** could be studied.

The U-Boot build included FIT-signature support and RSA verification, but the lab configuration also left several risky capabilities available, including:

- interactive bootloader access,
- mutable environment variables,
- peripheral-loading commands,
- unrestricted execution functionality.

## Why This Matters

A Chain of Trust is only as strong as its enforcement policy. If another execution path can bypass the component that performs signature verification, the cryptographic mechanism can remain mathematically correct while the overall system still becomes insecure.

## Two Emulated Targets

The report validates the overall behavior on two QEMU-emulated ARM profiles:

- generic ARM `virt` machine,
- Raspberry Pi 3 profile.

The use of more than one target helped show that the observed issues were configuration and architecture problems rather than being tied to one cryptographic key or one particular emulated target.
