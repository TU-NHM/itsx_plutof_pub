# itsx_plutof
EOSC-Nordic service preparations (ITSx)

ITSx - stand alone software for detecting and extracting ribosomal ITS sequence regions of fungi and other eukaryotes for use in environmental sequencing ([https://microbiology.se/software/itsx/](https://microbiology.se/software/itsx/)).

## Setup

### Pre-requisites

* OPTIONAL: [Singularity](https://sylabs.io/singularity/) - install Singularity (needed to create new singularity container)

### Setup steps

1. OPTIONAL: Create Singularity Image File (SIF)
    ```console
    sudo singularity build itsx_plutof.sif itsx_plutof.def
    ```

2. OPTIONAL: Copy SIF to HPC
    ```console
    scp itsx_plutof.sif example_hpc_user@example.com:
    ```

3. Run setup bash script (downloads singularity container and creates input and output data directories)
    ```console
    ./run_setup.sh
    ```

## Running the analysis (OPTIONAL: This could be done through sbatch slurm scripts)

**NB! The script expects input files in FASTA format, named as source_[run_id] and placed in indata/ directory.**

4. Run the pipeline using SIF (example data with run_id=11)
    ```console
    ./itsx_plutof.sif 11
    ```
