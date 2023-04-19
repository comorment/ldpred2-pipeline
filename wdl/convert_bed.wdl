workflow convert_bed_workflow {
    File bed = "/path/to/finngen_R11_hm3.bed"
    File createBackingFile = "/path/to/createBackingFile.R"
    File imputeGenotypes = "/path/to/imputeGenotypes.R"
    String OutputFilePrefix = "finngen_R11_hm3"

    call convert_bed {
         input:
             bed=bed, 
             createBackingFile=createBackingFile,
             imputeGenotypes=imputeGenotypes,
             OutputFilePrefix=OutputFilePrefix
    }
}

task convert_bed {
    File bed
    File createBackingFile
    File imputeGenotypes
    String OutputFilePrefix
    
    command {
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
        
        # convert and impute inplace
        Rscript ${createBackingFile} ${bed} ${OutputFilePrefix}
        Rscript ${imputeGenotypes} \
                --impute-simple mean0 --cores 4 \
                --geno-file-rds ${OutputFilePrefix}.rds
    }

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