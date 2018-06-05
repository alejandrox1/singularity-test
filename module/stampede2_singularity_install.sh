#!/bin/bash
set -e                                                                          
set -o pipefail                                                                 

# Compiler optimizations.
export CC=`which icc`
export CFLAGS="-xMIC-AVX512"
export LDFLAGS="-xMIC-AVX512"

# SRC destination.
SINGULARITY_SRC="/work/05692/jochoa/stampede2/apps/singularity"

mkdir -p "${SINGULARITY_SRC}" && \
    cd "${SINGULARITY_SRC}" && \
    git clone https://github.com/singularityware/singularity.git v2.5.1 && \
    cd v2.5.1 && \
    ./autogen.sh && \
    ./configure --prefix="${SINGULARITY_SRC}/v2.5.1" && \ 
    make && \
    make install
