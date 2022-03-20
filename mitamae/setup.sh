#!/bin/bash
set -o errexit -o pipefail -o xtrace

version=1.12.7

case "$(uname -m)" in
  x86_64) arch=x86_64 ;;
  arm64) arch=aarch64 ;;
  *) echo "unknown arch" >&2; exit 1
esac

case "$(uname -s)" in
  Linux) os=linux ;;
  Darwin) os=darwin ;;
  *) echo "unknown os" >&2; exit 1
esac

bin="mitamae-${arch}-${os}"
url="https://github.com/itamae-kitchen/mitamae/releases/download/v${version}/${bin}.tar.gz"

curl -fsSLo - ${url} | tar -xzvf - -C /tmp
mv /tmp/${bin} /usr/local/bin/mitamae
