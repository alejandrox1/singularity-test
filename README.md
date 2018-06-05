[![https://www.singularity-hub.org/static/img/hosted-singularity--hub-%23e32929.svg](https://www.singularity-hub.org/static/img/hosted-singularity--hub-%23e32929.svg)](https://singularity-hub.org/collections/1090)

# Testing Singularity

This repo is designed to have a small test case for the usage of an OpenMPI
executable on the Stampede2 supercomputer.

* [src](src/) contains the code necessary to build an executable.

* [module](module/) Stampede2 currently has version 2.3.1 installed as the
  module `tacc-singularity`. This is an atempt to install Singularity v2.5.1
  on the stampede2 supercomputer, along with its dependencies (there were
  significant changes to the API and Singularity itself between versions 2.3.X
  and 2.4.X). This still needs work...

  **TODO**:
  1. Finish installation of `squash-tools`.
  2. Make modules for `libarchive-dev` and `squash-tools`.

## Notes:
* `./src/mpi_hello_world` hangs when executed on a container based off `ubuntu
  16.04`. When checking the system resources, `mpirun singularity exec ubuntu
  mpi_hello_world` is indeed creating MPI tasks, however processes hang
  indefinetely alternating between `S` and `R` states.

* `MPICH` doesn't seem to work - hence the use of `OpenMPI`.
