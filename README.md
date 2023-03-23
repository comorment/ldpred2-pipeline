# ldpred2-pipeline
LDpred2 Docker setup for FinnGen

## building

    docker build -t ldpred2 -f docker/Dockerfile .


## run

Interactive R:

    docker run -it ldpred2 R

Invoking Rscript:

    docker run ldpred2 Rscript <filename>.R


## test

    py.test -v test/test_ldpred2.py


Note: this will only work in environments where Docker does not require sudo.