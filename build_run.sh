#!/bin/bash
set -e
set -o pipefail

IMG="ubuntu.simg"

# Uncomment it to rebuild the image.
#rm -rf "${IMG}"

make 
if [ ! -f "${IMG}" ]; then
    sudo singularity build "${IMG}" Singularity 
fi

mpirun -np 2 singularity exec "${IMG}" /usr/bin/mpi_hello_world
