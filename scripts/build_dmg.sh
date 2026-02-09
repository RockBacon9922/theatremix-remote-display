#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

APP_NAME="TheatreMix Remote Display"
BIN_NAME="theatremix_remote_display"

HOST_ARCH="$(uname -m)"
case "$HOST_ARCH" in
  arm64) HOST_TARGET="aarch64-apple-darwin" ;;
  x86_64) HOST_TARGET="x86_64-apple-darwin" ;;
  *)
    echo "Unsupported host arch: $HOST_ARCH" >&2
    exit 1
    ;;
esac

OTHER_TARGET=""
if [[ "$HOST_TARGET" == "aarch64-apple-darwin" ]]; then
  OTHER_TARGET="x86_64-apple-darwin"
else
  OTHER_TARGET="aarch64-apple-darwin"
fi

echo "Building for $HOST_TARGET..."
cargo build --release --target "$HOST_TARGET"

if rustup target list --installed | grep -q "^${OTHER_TARGET}$"; then
  echo "Building for $OTHER_TARGET..."
  cargo build --release --target "$OTHER_TARGET"
else
  echo "Rust target $OTHER_TARGET not installed; skipping other-arch build."
fi

HOST_BIN="target/$HOST_TARGET/release/$BIN_NAME"
OTHER_BIN="target/$OTHER_TARGET/release/$BIN_NAME"
if [[ -f "$HOST_BIN" && -f "$OTHER_BIN" ]]; then
  echo "Creating universal binary with lipo..."
  mkdir -p target/release
  lipo -create "$HOST_BIN" "$OTHER_BIN" -output "target/release/$BIN_NAME"
else
  echo "Other-arch binary not found; skipping lipo."
fi

mkdir -p dist

if ! command -v cargo-packager >/dev/null 2>&1; then
  echo "cargo-packager not found. Install with: cargo install cargo-packager --locked" >&2
  exit 1
fi

echo "Creating DMG with cargo packager..."
cargo packager --release --formats dmg
echo "DMG created in: dist/"
