# itsx_plutof
EOSC-Nordic service preparations (ITSx)

ITSx - stand alone software for detecting and extracting ribosomal ITS sequence regions of fungi and other eukaryotes for use in environmental sequencing ([https://microbiology.se/software/itsx/](https://microbiology.se/software/itsx/)).

## Setup

### Pre-requisites

* OPTIONAL: [Singularity](https://sylabs.io/singularity/) - install Singularity (needed to create new singularity container)

### Setup steps

There are 2 options. You can build the singularity container yourself from source code OR you can use our prebuilt one.

#### Using a prebuilt container. This should work for most of the users
1. Navigate to a prefferred directory/environment where you want to run the software
      
2. Run setup bash script (downloads singularity container and creates input and output data directories)
   ```console
    ./run_setup.sh
    ```

#### Building from source yourself.
You don't need to these steps if you're using the prebuilt container
 
1. Create Singularity Image File (SIF). 
    ```console
    sudo singularity build itsx_plutof.sif itsx_plutof.def
    ```

2. Copy SIF to HPC or any other place where you want to run the software
    ```console
    scp itsx_plutof.sif example_hpc_user@example.com:
    ```

## Running the analysis (OPTIONAL: This could be done through sbatch slurm scripts)

**NB! The script expects input files in FASTA format, named as source_[run_id] and placed in indata/ directory.**

#### Run the pipeline using SIF (example data with run_id=11)
   ```console
   ./itsx_plutof.sif 11
   ```
