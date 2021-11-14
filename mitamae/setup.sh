#!/bin/bash
set -o errexit -o pipefail -o xtrace

version=1.12.4
bin=mitamae-x86_64-linux

url="https://github.com/itamae-kitchen/mitamae/releases/download/v${version}/${bin}.tar.gz"

curl -fsSLo - ${url} | tar -xzvf - -C /tmp
mv /tmp/${bin} /usr/local/bin/mitamae
