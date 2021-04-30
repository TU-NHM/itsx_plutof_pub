#!/bin/bash

# create input and output data directories for ITSx
echo "Creating input and output directories for ITSx ..."
mkdir -p indata
mkdir -p userdir
mkdir -p outdata

# Download itsx_plutof.sif
echo "Downloading ITSx singularity container from https://plutof.ut.ee/#/filerepository/view/3950594 ...\n"
wget https://files.plutof.ut.ee/public/orig/8F/BC/8FBCA0F8DE48F0039394BC0E2E984BEF71100D219D0ADA287A66EC3B4DB6A67B
mv 8FBCA0F8DE48F0039394BC0E2E984BEF71100D219D0ADA287A66EC3B4DB6A67B itsx_plutof.sif

# end here
echo "Done"
