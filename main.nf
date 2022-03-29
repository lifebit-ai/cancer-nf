ch_run_sh_script = Channel.fromPath(params.html_report)

process report {
    publishDir "${params.outdir}/MultiQC", mode: 'copy'

    input:
    file(report) from ch_run_sh_script

    output:
    file "multiqc_report.html" into ch_multiqc_report

    script:
    """
    mv $report multiqc_report.html
    """
}