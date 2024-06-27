params.ref = "/courses/BINF6310.202430/students/chudasama.he/Hetvinexflow/Indexing_Genome/sequencemycobacyerium.fasta"
params.index_dir = "/courses/BINF6310.202430/students/chudasama.he/Hetvinexflow/Indexing_Genome/index_dir"


process index {
publishDir("${params.index_dir}", mode: 'copy')

input:
	path genome
output:
 path"*"

script:
"""
bwa index $genome
""" 
}

workflow {

ref_ch=channel.fromPath(params.ref)
index(ref_ch)


}

