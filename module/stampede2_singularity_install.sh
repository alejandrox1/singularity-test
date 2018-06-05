#!/bin/bash
set -e                                                                          
set -o pipefail                                                                 

module load gcc

# Compiler optimizations.
export CC=gcc

# SRC destination.
APPS_SRC="/work/05692/jochoa/stampede2/apps"
LIBARCHIVE_SRC="${APPS_SRC}/libarchive"
LIBARCHIVE_VERSION="v3.3.2"
SQUASH_SRC="${APPS_SRC}/squashfs-tools"
SQUASH_VERSION="4.3"
SINGULARITY_SRC="${APPS_SRC}/singularity"
SINGULARITY_VERSION="2.5.1"


mkdir -p "${LIBARCHIVE_SRC}" && \
    cd "${LIBARCHIVE_SRC}" && \
    [ -d "${LIBARCHIVE_VERSION}" ] && rm -rf "${LIBARCHIVE_VERSION}" && \
    git clone https://github.com/libarchive/libarchive "${LIBARCHIVE_VERSION}" && \
    cd "${LIBARCHIVE_VERSION}" && \
    git fetch origin --tags --prune && \
    git checkout "${LIBARCHIVE_VERSION}" && \
    ./build/autogen.sh && \
    ./configure --prefix="${LIBARCHIVE_SRC}/${LIBARCHIVE_VERSION}" && \
    make && \
    make install

mkdir -p "${SQUASH_SRC}" && \
    cd "${SQUASH_SRC}" && \
    [ -d "${SQUASH_VERSION}" ] && rm -rf "${SQUASH_VERSION}" && \
    wget "https://sourceforge.net/projects/squashfs/files/squashfs/squashfs${SQUASH_VERSION}/squashfs${SQUASH_VERSION}.tar.gz" && \
    tar -xvzf "squashfs${SQUASH_VERSION}.tar.gz" && \
    mv "squashfs${SQUASH_VERSION}" "${SQUASH_VERSION}" && \


export CPPFLAGS="-I/work/05692/jochoa/stampede2/apps/libarchive/v3.3.2/include"
export LDFLAGS="-L/work/05692/jochoa/stampede2/apps/libarchive/v3.3.2/lib"

mkdir -p "${SINGULARITY_SRC}" && \
    cd "${SINGULARITY_SRC}" && \
    [ -d "v${SINGULARITY_VERSION}" ] && rm -rf "v${SINGULARITY_VERSION}" && \
    git clone https://github.com/singularityware/singularity.git "v${SINGULARITY_VERSION}" && \
    cd "v${SINGULARITY_VERSION}" && \
    git fetch origin --tags --prune && \
    git checkout "${SINGULARITY_VERSION}" && \
    ./autogen.sh && \
    ./configure --prefix="${SINGULARITY_SRC}/v${SINGULARITY_VERSION}" && \
    make && \
    make install
