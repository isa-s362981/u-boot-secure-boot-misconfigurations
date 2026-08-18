#!/usr/bin/env bash
set -euo pipefail

KEY_DIR="${KEY_DIR:-keys}"
mkdir -p "$KEY_DIR"

openssl genrsa -out "$KEY_DIR/dev1.key" 2048
openssl req -batch -new -x509 -key "$KEY_DIR/dev1.key" -out "$KEY_DIR/dev1.crt"

openssl genrsa -out "$KEY_DIR/dev2.key" 2048
openssl req -batch -new -x509 -key "$KEY_DIR/dev2.key" -out "$KEY_DIR/dev2.crt"

echo "Generated temporary academic test keys in: $KEY_DIR"
echo "Do not commit private keys to GitHub."
