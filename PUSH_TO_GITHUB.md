# Push This Project to GitHub

## 1. Create an empty repository on GitHub

Suggested repository name:

```text
u-boot-secure-boot-misconfigurations
```

Do **not** add a README, `.gitignore`, or license when creating it, because this project already contains those files.

## 2. Open a terminal in this project folder

```bash
cd u-boot-secure-boot-misconfigurations
```

## 3. Initialize Git and create the first commit

```bash
git init
git add .
git status
git commit -m "Initial release of U-Boot Secure Boot project"
git branch -M main
```

Before committing, confirm that no private keys such as `*.key` or `*.pem` are listed by `git status`.

## 4. Connect the GitHub repository

Replace `YOUR_USERNAME` with your GitHub username:

```bash
git remote add origin https://github.com/YOUR_USERNAME/u-boot-secure-boot-misconfigurations.git
```

## 5. Push

```bash
git push -u origin main
```

GitHub may ask you to authenticate in the browser or with a supported credential manager.

## Recommended Repository Description

```text
Academic analysis of U-Boot Secure Boot misconfigurations using QEMU, ARM, RSA-2048, SHA-256 and FIT images.
```

## Suggested GitHub Topics

```text
u-boot
secure-boot
embedded-security
embedded-systems
qemu
arm
cybersecurity
linux
rsa
chain-of-trust
```
