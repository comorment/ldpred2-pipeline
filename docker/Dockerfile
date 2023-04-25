# R container
FROM rocker/r-ver:4.0.5

ENV TZ=Europe
ENV DEBIAN_FRONTEND noninteractive

WORKDIR /tmp/

# R dependencies
RUN R -e "install.packages('devtools', version='2.4.5', repos='https://packagemanager.rstudio.com/cran/__linux__/focal/2023-02-16', dependencies=c('Depends', 'Imports', 'LinkingTo'))" && \
    R -e "install.packages('argparser', version='0.7.1', repos='https://packagemanager.rstudio.com/cran/__linux__/focal/2023-02-16', dependencies=c('Depends', 'Imports', 'LinkingTo'))" && \
    R -e "install.packages('bigsnpr', version='1.11.6', repos='https://packagemanager.rstudio.com/cran/__linux__/focal/2023-02-16', dependencies=c('Depends', 'Imports', 'LinkingTo'))" && \
    R -e "install.packages('data.table', version='1.14.6', repos='https://packagemanager.rstudio.com/cran/__linux__/focal/2023-02-16', dependencies=c('Depends', 'Imports', 'LinkingTo'))" && \
    R -e "install.packages('stringr', version='1.5.0', repos='https://packagemanager.rstudio.com/cran/__linux__/focal/2023-02-16', dependencies=c('Depends', 'Imports', 'LinkingTo'))" && \
    R -e "install.packages('R.utils', version='2.12.2', repos='https://packagemanager.rstudio.com/cran/__linux__/focal/2023-02-16', dependencies=c('Depends', 'Imports', 'LinkingTo'))" && \
    R -e "install.packages('dplyr', version='1.1.0', repos='https://packagemanager.rstudio.com/cran/__linux__/focal/2023-02-16', dependencies=c('Depends', 'Imports', 'LinkingTo'))"


# some system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends apt-utils=2.0.9 && \
    apt-get update && apt-get install -y --no-install-recommends ca-certificates=20211016ubuntu0.20.04.1 && \
    update-ca-certificates
RUN apt-get update && apt-get install -y --no-install-recommends \
   unzip=6.0-25ubuntu1.1 \
   wget=1.20.3-1ubuntu2 \
   && \
   apt-get clean && \
   rm -rf /var/lib/apt/lists/*

# install plink
RUN wget --no-check-certificate https://s3.amazonaws.com/plink1-assets/plink_linux_x86_64_20200616.zip && \
    unzip -j plink_linux_x86_64_20200616.zip && \
    rm -rf plink_linux_x86_64_20200616.zip && \
    cp plink /bin

RUN rm -rf /tmp/*

WORKDIR /
