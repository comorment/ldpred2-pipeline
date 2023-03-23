# LDpred2-pipeline
LDpred2 Docker setup for FinnGen, incorporating the basic dependencies for running [LDpred2](https://privefl.github.io/bigsnpr/articles/LDpred2.html). 
Based on the implementation made available at [comorment/containers](https://github.com/comorment/containers)
## Docker
### Building

In order to build the container as `ldpred2`, issue:

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

In order to run these LDpred2-based codes on real-world data, the files made available in https://github.com/comorment/ldpred2_ref must be downloaded and found locally.


## Scripts

See [scripts/README.md](https://github.com/comorment/ldpred2-pipeline/scripts/README.md) for further details.
