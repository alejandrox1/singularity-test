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
SINGULARITY_SRC="${APPS_SRC}/singularity"
SINGULARITY_VERSION="2.5.1"


mkdir -p "${LIBARCHIVE_SRC}" && \
    cd "${LIBARCHIVE_SRC}" && \
    git clone https://github.com/libarchive/libarchive "${LIBARCHIVE_VERSION}" && \
    cd "${LIBARCHIVE_VERSION}" && \
    git fetch origin --tags --prune && \
    git checkout "${LIBARCHIVE_VERSION}" && \
    build/autogen.sh && \
    ./configure --prefix="${LIBARCHIVE_VERSION}" && \
    make && \
    make install


mkdir -p "${SINGULARITY_SRC}" && \
    cd "${SINGULARITY_SRC}" && \
    git clone https://github.com/singularityware/singularity.git "v${SINGULARITY_VERSION}" && \
    cd "v${SINGULARITY_VERSION}" && \
    git fetch origin --tags --prune && \
    git checkout "${SINGULARITY_VERSION}" && \
    ./autogen.sh && \
    ./configure --prefix="${SINGULARITY_SRC}/v${SINGULARITY_VERSION}" && \
    make && \
    make install
