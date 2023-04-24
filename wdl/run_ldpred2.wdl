workflow ldpred2_workflow {
    File sumstats = "LIBRARY_RED/Nelli_F/Nordic_collaboration/NewSumstats.TBL"
    File rds = "/path/to/genofile.rds"
    File bk = "/path/to/genofile.bk"
    File fun = "LIBRARY_RED/Nelli_F/Nordic_collaboration/ldpred2/LDpred2/fun.R"
    File ldpred2 = "/LIBRARY_RED/Nelli_F/Nordic_collaboration/ldpred2/LDpred2/ldpred2.R"
    String ldpred2_mode = "auto"
    String col_snp_id = "MarkerName"
    String col_chr = "#CHROM"
    String col_bp = "POS"
    String col_A1 = "Allele1"
    String col_A2 = "Allele2"
    String col_stat = "Effect"
    String col_stat_se = "StdErr"
    String col_pvalue = "P-value"
    String col_n = "N"
    String stat_type = "OR"
    File map = "LIBRARY_RED/Nelli_F/Nordic_collaboration/ldpred2/map_hm3_plus.rds"
    Array[File] chr = [
        "LIBRARY_RED/Nelli_F/Nordic_collaboration/ldpred2/ldref_hm3_plus/LD_with_blocks_chr1.rds",
        "LIBRARY_RED/Nelli_F/Nordic_collaboration/ldpred2/ldref_hm3_plus/LD_with_blocks_chr2.rds",
        "LIBRARY_RED/Nelli_F/Nordic_collaboration/ldpred2/ldref_hm3_plus/LD_with_blocks_chr3.rds",
        "LIBRARY_RED/Nelli_F/Nordic_collaboration/ldpred2/ldref_hm3_plus/LD_with_blocks_chr4.rds",
        "LIBRARY_RED/Nelli_F/Nordic_collaboration/ldpred2/ldref_hm3_plus/LD_with_blocks_chr5.rds",
        "LIBRARY_RED/Nelli_F/Nordic_collaboration/ldpred2/ldref_hm3_plus/LD_with_blocks_chr6.rds",
        "LIBRARY_RED/Nelli_F/Nordic_collaboration/ldpred2/ldref_hm3_plus/LD_with_blocks_chr7.rds",
        "LIBRARY_RED/Nelli_F/Nordic_collaboration/ldpred2/ldref_hm3_plus/LD_with_blocks_chr8.rds",
        "LIBRARY_RED/Nelli_F/Nordic_collaboration/ldpred2/ldref_hm3_plus/LD_with_blocks_chr9.rds",
        "LIBRARY_RED/Nelli_F/Nordic_collaboration/ldpred2/ldref_hm3_plus/LD_with_blocks_chr10.rds",
        "LIBRARY_RED/Nelli_F/Nordic_collaboration/ldpred2/ldref_hm3_plus/LD_with_blocks_chr11.rds",
        "LIBRARY_RED/Nelli_F/Nordic_collaboration/ldpred2/ldref_hm3_plus/LD_with_blocks_chr12.rds",
        "LIBRARY_RED/Nelli_F/Nordic_collaboration/ldpred2/ldref_hm3_plus/LD_with_blocks_chr13.rds",
        "LIBRARY_RED/Nelli_F/Nordic_collaboration/ldpred2/ldref_hm3_plus/LD_with_blocks_chr14.rds",
        "LIBRARY_RED/Nelli_F/Nordic_collaboration/ldpred2/ldref_hm3_plus/LD_with_blocks_chr15.rds",
        "LIBRARY_RED/Nelli_F/Nordic_collaboration/ldpred2/ldref_hm3_plus/LD_with_blocks_chr16.rds",
        "LIBRARY_RED/Nelli_F/Nordic_collaboration/ldpred2/ldref_hm3_plus/LD_with_blocks_chr17.rds",
        "LIBRARY_RED/Nelli_F/Nordic_collaboration/ldpred2/ldref_hm3_plus/LD_with_blocks_chr18.rds",
        "LIBRARY_RED/Nelli_F/Nordic_collaboration/ldpred2/ldref_hm3_plus/LD_with_blocks_chr19.rds",
        "LIBRARY_RED/Nelli_F/Nordic_collaboration/ldpred2/ldref_hm3_plus/LD_with_blocks_chr20.rds",
        "LIBRARY_RED/Nelli_F/Nordic_collaboration/ldpred2/ldref_hm3_plus/LD_with_blocks_chr21.rds",
        "LIBRARY_RED/Nelli_F/Nordic_collaboration/ldpred2/ldref_hm3_plus/LD_with_blocks_chr22.rds"]

    call run_ldpred2 {
        input:
            sumstats=sumstats,
            rds=rds,
            bk=bk,
            fun=fun,
            ldpred2=ldpred2,
            ldpred2_mode=ldpred2_mode,
            col_snp_id=col_snp_id,
            col_chr=col_chr,
            col_bp=col_bp,
            col_A1=col_A1,
            col_A2=col_A2,
            col_stat=col_stat,
            col_stat_se=col_stat_se,
            col_pvalue=col_pvalue,
            col_n=col_n,
            stat_type=stat_type,
            map=map,
            chr=chr
    }
}

task run_ldpred2 {
    File sumstats
    File rds
    File bk
    File fun
    File ldpred2
    String ldpred2_mode
    String col_snp_id
    String col_chr
    String col_bp
    String col_A1
    String col_A2
    String col_stat
    String col_stat_se
    String col_pvalue
    String col_n
    String stat_type
    File map
    Array[File] chr
    
    command <<<
        # put reference datas in place
        mkdir -p ldpred2_ref/ldref_hm3_plus
        cp ${map} ldpred2_ref/.
        for fname in ${sep=" " chr}; do
            cp $fname ldpred2_ref/ldref_hm3_plus/.
        done


        # copy R scripts
        cp ${ldpred2} .
        cp ${fun} .

        # run LDpred2
        Rscript ldpred2.R \
            --ldpred-mode ${ldpred2_mode} \
            --col-snp-id ${col_snp_id} \
            --col-chr ${col_chr} \
            --col-bp ${col_bp} \
            --col-A1 ${col_A1} \
            --col-A2 ${col_A2} \
            --col-stat ${col_stat} \
            --col-stat-se ${col_stat_se} \
            --col-pvalue ${col_pvalue} \
            --col-n ${col_n} \
            --stat-type ${stat_type} \
            --ld-file ldpred2_ref/ldref_hm3_plus/LD_with_blocks_chr@.rds \
            --ld-meta-file ldpred2_ref/map_hm3_plus.rds \
            --geno-file-rds ${rds} \
            --sumstats ${sumstats} \
            --out PGS.${ldpred2_mode}
    >>>

    output {
        File out_red = "PGS.${ldpred2_mode}"
        File out_red_png = "PGS.${ldpred2_mode}.png"
    }

    runtime {
        docker: "eu.gcr.io/finngen-sandbox-v3-containers/ldpred2"
        cpu: 16
        memory: "128 GB"
        disks: "local-disk 8000 HDD"
        zones: "europe-west1-b"
    }
}