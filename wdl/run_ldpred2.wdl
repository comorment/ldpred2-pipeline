workflow ldpred2_workflow {
    File sumstats = "/path/to/summary/statistics/file"
    File rds = "/path/to/genofile.rds"
    File bk = "/path/to/genofile.bk"
    File fun = "/path/to/fun.R"
    File ldpred2 = "/path/to/ldpred2.R"
    String ldpred2_mode = "auto"
    String col_snp_id = "MarkerName"
    String col_chr = "X.CHROM"
    String col_bp = "POS"
    String col_A1 = "Allele1"
    String col_A2 = "Allele2"
    String col_stat = "Effect"
    String col_stat_se = "StdErr"
    String col_pvalue = "P-value"
    String col_n = "N"
    String stat_type = "OR"
    File map = "/path/to/ldpred2_ref/map_hm3_plus.rds"
    File chr1 = "/path/to/ldpred2_ref/ldref_hm3_plus/LD_with_blocks_chr1.rds"
    File chr2 = "/path/to/ldpred2_ref/ldref_hm3_plus/LD_with_blocks_chr2.rds"
    File chr3 = "/path/to/ldpred2_ref/ldref_hm3_plus/LD_with_blocks_chr3.rds"
    File chr4 = "/path/to/ldpred2_ref/ldref_hm3_plus/LD_with_blocks_chr4.rds"
    File chr5 = "/path/to/ldpred2_ref/ldref_hm3_plus/LD_with_blocks_chr5.rds"
    File chr6 = "/path/to/ldpred2_ref/ldref_hm3_plus/LD_with_blocks_chr6.rds"
    File chr7 = "/path/to/ldpred2_ref/ldref_hm3_plus/LD_with_blocks_chr7.rds"
    File chr8 = "/path/to/ldpred2_ref/ldref_hm3_plus/LD_with_blocks_chr8.rds"
    File chr9 = "/path/to/ldpred2_ref/ldref_hm3_plus/LD_with_blocks_chr9.rds"
    File chr10 = "/path/to/ldpred2_ref/ldref_hm3_plus/LD_with_blocks_chr10.rds"
    File chr11 = "/path/to/ldpred2_ref/ldref_hm3_plus/LD_with_blocks_chr11.rds"
    File chr12 = "/path/to/ldpred2_ref/ldref_hm3_plus/LD_with_blocks_chr12.rds"
    File chr13 = "/path/to/ldpred2_ref/ldref_hm3_plus/LD_with_blocks_chr13.rds"
    File chr14 = "/path/to/ldpred2_ref/ldref_hm3_plus/LD_with_blocks_chr14.rds"
    File chr15 = "/path/to/ldpred2_ref/ldref_hm3_plus/LD_with_blocks_chr15.rds"
    File chr16 = "/path/to/ldpred2_ref/ldref_hm3_plus/LD_with_blocks_chr16.rds"
    File chr17 = "/path/to/ldpred2_ref/ldref_hm3_plus/LD_with_blocks_chr17.rds"
    File chr18 = "/path/to/ldpred2_ref/ldref_hm3_plus/LD_with_blocks_chr18.rds"
    File chr19 = "/path/to/ldpred2_ref/ldref_hm3_plus/LD_with_blocks_chr19.rds"
    File chr20 = "/path/to/ldpred2_ref/ldref_hm3_plus/LD_with_blocks_chr20.rds"
    File chr21 = "/path/to/ldpred2_ref/ldref_hm3_plus/LD_with_blocks_chr21.rds"
    File chr22 = "/path/to/ldpred2_ref/ldref_hm3_plus/LD_with_blocks_chr22.rds"

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
            chr1=chr1,
            chr2=chr2,
            chr3=chr3,
            chr4=chr4,
            chr5=chr5,
            chr6=chr6,
            chr7=chr7,
            chr8=chr8,
            chr9=chr9,
            chr10=chr10,
            chr11=chr11,
            chr12=chr12,
            chr13=chr13,
            chr14=chr14,
            chr15=chr15,
            chr16=chr16,
            chr17=chr17,
            chr18=chr18,
            chr19=chr19,
            chr20=chr20,
            chr21=chr21,
            chr22=chr22
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
    File chr1
    File chr2
    File chr3
    File chr4
    File chr5
    File chr6
    File chr7
    File chr8
    File chr9
    File chr10
    File chr11
    File chr12
    File chr13
    File chr14
    File chr15
    File chr16
    File chr17
    File chr18
    File chr19
    File chr20
    File chr21
    File chr22
    
    command <<<
        # put reference datas in place
        mkdir -p ldpred2_ref/ldref_hm3_plus
        cp ${map} ldpred2_ref/.
        cp ${chr1} ldpred2_ref/ldref_hm3_plus/.
        cp ${chr2} ldpred2_ref/ldref_hm3_plus/.
        cp ${chr3} ldpred2_ref/ldref_hm3_plus/.
        cp ${chr4} ldpred2_ref/ldref_hm3_plus/.
        cp ${chr5} ldpred2_ref/ldref_hm3_plus/.
        cp ${chr6} ldpred2_ref/ldref_hm3_plus/.
        cp ${chr7} ldpred2_ref/ldref_hm3_plus/.
        cp ${chr8} ldpred2_ref/ldref_hm3_plus/.
        cp ${chr9} ldpred2_ref/ldref_hm3_plus/.
        cp ${chr10} ldpred2_ref/ldref_hm3_plus/.
        cp ${chr11} ldpred2_ref/ldref_hm3_plus/.
        cp ${chr12} ldpred2_ref/ldref_hm3_plus/.
        cp ${chr13} ldpred2_ref/ldref_hm3_plus/.
        cp ${chr14} ldpred2_ref/ldref_hm3_plus/.
        cp ${chr15} ldpred2_ref/ldref_hm3_plus/.
        cp ${chr16} ldpred2_ref/ldref_hm3_plus/.
        cp ${chr17} ldpred2_ref/ldref_hm3_plus/.
        cp ${chr18} ldpred2_ref/ldref_hm3_plus/.
        cp ${chr19} ldpred2_ref/ldref_hm3_plus/.
        cp ${chr20} ldpred2_ref/ldref_hm3_plus/.
        cp ${chr21} ldpred2_ref/ldref_hm3_plus/.
        cp ${chr22} ldpred2_ref/ldref_hm3_plus/.

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
        memory: "64 GB"
        disks: "local-disk 8000 HDD"
        zones: "europe-west1-b"
    }
}