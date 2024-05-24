#!/usr/bin/env bash
set -euxo pipefail
cd "$(dirname "$0")"

mkdir -p /root/work
apt-get update && apt-get install -y tig vim build-essential
curl https://mise.run | sh
echo 'eval "$(~/.local/bin/mise activate bash)"' >> ~/.bashrc
