# R container
FROM rocker/r-ver:4.0.5

ENV TZ=Europe
ENV DEBIAN_FRONTEND noninteractive

WORKDIR /tmp/
RUN R -e "install.packages('devtools', version='2.4.5', repos='https://packagemanager.rstudio.com/cran/__linux__/focal/2023-02-16', dependencies=c('Depends', 'Imports', 'LinkingTo'))" && \
    R -e "install.packages('argparser', version='0.7.1', repos='https://packagemanager.rstudio.com/cran/__linux__/focal/2023-02-16', dependencies=c('Depends', 'Imports', 'LinkingTo'))" && \
    R -e "install.packages('bigsnpr', version='1.11.6', repos='https://packagemanager.rstudio.com/cran/__linux__/focal/2023-02-16', dependencies=c('Depends', 'Imports', 'LinkingTo'))" && \
    R -e "install.packages('data.table', version='1.14.6', repos='https://packagemanager.rstudio.com/cran/__linux__/focal/2023-02-16', dependencies=c('Depends', 'Imports', 'LinkingTo'))" && \
    R -e "install.packages('stringr', version='1.5.0', repos='https://packagemanager.rstudio.com/cran/__linux__/focal/2023-02-16', dependencies=c('Depends', 'Imports', 'LinkingTo'))"
