help (
[[
This module is for a locally-installed version of singularity.

Singularity is not installed and should not be run on the login nodes.

A functional Singularity module is available on the compute nodes. Submit
Singularity job scripts to the queue with 'sbatch'. If you would like to run
Singularity interactively, please start an interactive session with 'idev'.

[login]\$ idev
[compute]\$ singularity run container.img

The tacc-singularity module file defines the following environment variables:

 - TACC_SINGULARITY_DIR
 - TACC_SINGULARITY_BIN
 - TACC_SINGULARITY_LIB
 - TACC_SINGULARITY_INC
 - TACC_SINGULARITY_LEXE
 - TACC_SINGULARITY_ETC
 - TACC_SINGULARITY_EXAMPLES

for the location of the tacc-singularity distribution.

Singularity Main - http://singularity.lbl.gov
TACC-Singularity - https://github.com/TACC/TACC-Singularity

Version 2.5.1
]])

whatis("Name: singularity")
whatis("Version: 2.5.1")
whatis("Category: applications, virtualization")
whatis("Keywords: virtualization, applications")
whatis("Description: Application and environment virtualization")
whatis("URL: http://singularity.lbl.gov")

prepend_path("PATH",            "/work/05692/jochoa/stampede2/apps/singularity/v2.5.1/bin")
prepend_path("LD_LIBRARY_PATH", "/work/05692/jochoa/stampede2/apps/singularity/v2.5.1/lib64")
prepend_path("MANPATH",         "/work/05692/jochoa/stampede2/apps/singularity/v2.5.1/man")

setenv("TACC_SINGULARITY_DIR",     "/work/05692/jochoa/stampede2/apps/singularity/v2.5.1")
setenv("TACC_SINGULARITY_EXAMPLES","/work/05692/jochoa/stampede2/apps/singularity/v2.5.1/examples")
setenv("TACC_SINGULARITY_BIN",  "/work/05692/jochoa/stampede2/apps/singularity/v2.5.1/bin")
setenv("TACC_SINGULARITY_ETC",  "/work/05692/jochoa/stampede2/apps/singularity/v2.5.1/etc")
setenv("TACC_SINGULARITY_INC",  "/work/05692/jochoa/stampede2/apps/singularity/v2.5.1/include")
setenv("TACC_SINGULARITY_LIB",  "/work/05692/jochoa/stampede2/apps/singularity/v2.5.1/lib64")
setenv("TACC_SINGULARITY_LEXE", "/work/05692/jochoa/stampede2/apps/singularity/v2.5.1/libexec")

if (myShellName() == "bash") then
    execute{cmd="source ".. "/work/05692/jochoa/stampede2/apps/singularity/v2.5.1/etc/bash_completion.d/singularity", modeA={"load"}}
end

