# LDpred2-pipeline

LDpred2 Docker setup for FinnGen, incorporating the basic dependencies for running [LDpred2](https://privefl.github.io/bigsnpr/articles/LDpred2.html).
Based on the implementation made available at [comorment/containers](https://github.com/comorment/containers)

## Docker

### Building

In order to build the container locally as `ldpred2`, issue:

    docker build -t ldpred2 -f docker/Dockerfile .

### Run

Interactive R session:

    docker run -it ldpred2 R

Invoking Rscript on R file:

    docker run -it ldpred2 Rscript <filename>.R

### Test

Basic test that the built container can be used:

    pip3 install pytest  # install the py.test software. Run once.
    py.test -v test/test_ldpred2.py

Note: this will only work in environments where Docker does not require sudo.

## Reference data

In order to run these LDpred2-based codes on real-world data, the files made available in <https://github.com/comorment/ldpred2_ref> must be downloaded and found locally.

## Scripts

See [scripts/README.md](scripts/README.md) for further details.

## WDL

The [wdl](wdl) directory contains WDL workflow language file ([openwdl.org](https://openwdl.org)) templates for converting Plink (.bed, .bim, .fam) files to a LDpred2 compatible format and running LDpred2 itself.
Files:

- [``wdl/convert_bed.wdl``](wdl/convert_bed.wdl): converts genotype files to .rds/.bk files
- [``wdl/run_ldpred2.wdl``](wdl/run_ldpred2.wdl): run LDpred2.

### Notes

For all workflow files, make sure that all file paths (``File``) points to correct files.
For the LDpred2 part, make sure that the ``String col_* = "<column>"`` arguments points to valid columns in the sumstats file.
If certain columns like chromosome (``col_chr``) and position (``col_bp``) do not exist in the sumstats file, they may be included using the [``scripts/complementSumstats.R](scripts/complementSumstats.R) script in R. 
Note that it requires an external reference file argument (``--reference /path/to/HRC.r1-1.GRCh37.wgs.mac5.sites.tab.gz``) from [comorment/containers](https://github.com/comorment/containers/blob/main/reference/hrc/HRC.r1-1.GRCh37.wgs.mac5.sites.tab.gz).
