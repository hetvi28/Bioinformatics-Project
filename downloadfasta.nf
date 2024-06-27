process downloadFasta {
    output:
    file 'CP000325.1.fasta'

    """
    curl -o CP000325.1.fasta https://www.ebi.ac.uk/ena/browser/api/fasta/CP000325.1?download=true
    """
}

workflow {
    downloadFasta()
}

