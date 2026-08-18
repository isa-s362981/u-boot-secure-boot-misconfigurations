# 03 — Environment-Variable Hijacking

## Objective

Study how writable boot configuration can undermine an otherwise cryptographically protected boot flow.

## Lab Observation

The project demonstrated that a mutable `bootcmd` can redirect the expected boot sequence when an attacker already has access to the U-Boot shell.

## Relevant U-Boot Commands Used in the Lab

```text
printenv bootcmd
setenv bootcmd "go 0x42000000"
saveenv
```

## Defensive Takeaway

Critical boot variables should be immutable in production. Unnecessary environment write functionality should be disabled, and sensitive boot-flow configuration should be protected from modification.
