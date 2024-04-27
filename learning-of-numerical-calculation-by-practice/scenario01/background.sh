#!/usr/bin/env bash
set -euxo pipefail
cd "$(dirname "$0")"

apt-get update && apt-get install -y tig vim gfortran gcc
