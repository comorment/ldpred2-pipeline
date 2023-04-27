workflow complement_sumstats_workflow {
    File sumstats_file = "SANDBOX_RED/Nelli_F/Nordic_collaboration/OldSumstats.TBL"
    File reference = "SANDBOX_RED/Nelli_F/Nordic_collaboration/HRC.r1-1.GRCh37.wgs.mac5.sites.tab"
    File complementSumstats = "SANDBOX_RED/Nelli_F/Nordic_collaboration/ldpred2/LDpred2/complementSumstats.R"
    String col_sumstats_snp_id = "MarkerName"
    String newsumstats_file = "NewSumstats.TBL"

    call complement_sumstats {
        input:
            sumstats_file=sumstats_file,
            reference=reference,
            complementSumstats=complementSumstats,
            col_sumstats_snp_id=col_sumstats_snp_id,
            newsumstats_file=newsumstats_file,
    }
}

task complement_sumstats {
    File sumstats_file
    File reference
    File complementSumstats
    String col_sumstats_snp_id
    String newsumstats_file
    
    command <<<
        # copy R scripts and data
        cp ${sumstats_file} .
        cp ${reference} .
        cp ${complementSumstats} .

        # run
        Rscript complementSumstats.R \
            --sumstats ${sumstats} \
            --reference ${reference} \
            --col-sumstats-snp-id ${col_sumtats_snp_id} \
            --file-output ${newsumstats_file}
        
        # compress
        gzip ${newsumstats_file}
    >>>

    output {
        File out_red = "${newsumstats_file}.gz"
    }

    runtime {
        docker: "eu.gcr.io/finngen-sandbox-v3-containers/ldpred2"
        cpu: 1
        memory: "16 GB"
        disks: "local-disk 8000 HDD"
        zones: "europe-west1-b"
    }
}