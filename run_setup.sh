#!/bin/bash

# create input and output data directories for massBLASTer
echo "Creating input and output directories for ITSx ..."
mkdir indata
mkdir userdir
mkdir outdata

# Download itsx_plutof.sif
echo "Downloading ITSx singularity container from https://plutof.ut.ee/#/filerepository/view/3576413 ...\n"
wget https://files.plutof.ut.ee/public/orig/C5/BA/C5BA922996A4243C30F0B4BBCC6F7DAA3643FC6CB99CF6851C3891CD57E34DA5
mv C5BA922996A4243C30F0B4BBCC6F7DAA3643FC6CB99CF6851C3891CD57E34DA5 itsx_plutof.sif

# end here
echo "Done"