#!/bin/bash

set -ex

export WORKDIR=$(pwd)/..
export INSTALL_SCRIPTS_DIR=$(pwd)
mkdir -p "${WORKDIR}"

apt update
apt install -y python3.8 python3.8-distutils libpython3.8-dev python3.8-tk xvfb psmisc

# install and initialize micromamba
if [ ! -d "/root/micromamba" ]; then
    "${SHELL}" <(curl -L micro.mamba.pm/install.sh) < /dev/null
fi
source ~/.bashrc
export PATH=/root/micromamba/bin:$PATH
if ! micromamba list | grep -q "^$env_name\s"; then
    micromamba create -n base -y python=3.8
fi

pushd "${WORKDIR}" 
    wget -nc -O /tmp/IsaacGym_Preview_4_Package.tar.gz https://developer.nvidia.com/isaac-gym-preview-4 || true
    tar -xvf /tmp/IsaacGym_Preview_4_Package.tar.gz
popd

micromamba run -n eureka bash install.internal.sh
