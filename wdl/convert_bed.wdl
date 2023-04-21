workflow convert_bed_workflow {
    File bed = "LIBRARY_RED/finngen_R11/genotype_plink_1.0/finngen_R11_hm3.bed"
    File createBackingFile = "SANDBOX_RED/Nelli_F/Nordic_collaboration/ldpred2/LDpred2/createBackingFile.R"
    File imputeGenotypes = "SANDBOX_RED/Nelli_F/Nordic_collaboration/ldpred2/LDpred2/imputeGenotypes.R"
    File fun = "SANDBOX_RED/Nelli_F/Nordic_collaboration/ldpred2/LDpred2/fun.R"
    String OutputFilePrefix = "finngen_R11_hm3"

    call convert_bed {
        input:
            bed=bed, 
            createBackingFile=createBackingFile,
            imputeGenotypes=imputeGenotypes,
            fun=fun,
            OutputFilePrefix=OutputFilePrefix
    }
}

task convert_bed {
    File bed
    File createBackingFile
    File imputeGenotypes
    File fun
    String OutputFilePrefix
    
    command <<<
        # check that files exist
        if test -f ${bed}; then
            echo "${bed} exists."
        fi
        if test -f ${createBackingFile}; then
            echo "${createBackingFile} exists."
        fi
        if test -f ${imputeGenotypes}; then
            echo "${imputeGenotypes} exists."
        fi
        if test -f ${fun}; then
            echo "${fun} exists."
        fi
        
        # copy R scripts
        cp ${createBackingFile} .
        cp ${imputeGenotypes} .
        cp ${fun} .

        # convert and impute inplace
        Rscript createBackingFile.R ${bed} ${OutputFilePrefix}
        Rscript imputeGenotypes.R \
            --impute-simple mean0 --cores 4 \
            --geno-file-rds ${OutputFilePrefix}.rds
    >>>

    output {
        File out_red_bk = "${OutputFilePrefix}.bk"
        File out_red_rds = "${OutputFilePrefix}.rds"
    }

    runtime {
        docker: "eu.gcr.io/finngen-sandbox-v3-containers/ldpred2"
        cpu: 4
        memory: "16 GB"
        disks: "local-disk 8000 HDD"
        zones: "europe-west1-b"
    }
}