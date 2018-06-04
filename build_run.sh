#!/bin/bash
set -e
set -o pipefail

IMG="ubuntu.simg"

if [ ! -f "${IMG}" ]; then
    sudo singularity build "${IMG}" Singularity 
fi

( cd src; make )
mpirun -np 2 singularity exec "${IMG}" ./src/mpi_hello_world 
