# Convert hg19.bw to hg38.bw
# What is CrossMap ? https://crossmap.sourceforge.net/   https://anaconda.org/bioconda/crossmap 
# CrossMap is a program for genome coordinates conversion between different assemblies (such as hg18 (NCBI36) <=> hg19 (GRCh37) <=> hg38 (GRCh38)).
# It supports commonly used file formats including BAM, CRAM, SAM, Wiggle, BigWig, BED, GFF, GTF, MAF VCF, and gVCF.

# To execute the contents of the .bashrc file in the current shell session (necessary to start conda)
    source ~/.bashrc

# install the Crossmap
    cd anaconda3/envs/                                     # go to your anaconda3 directory
    
    conda create --name convert_bigwig_hg19_to_hg38        # create your ucsc-bedgraphtobigwig environment
    
    cd anaconda3/envs/convert_bigwig_hg19_to_hg38/         #go to your working directory
    
    conda activate convert_bigwig_hg19_to_hg38             #activate conda environment
    
    conda install -c bioconda crossmap  #install ucsc-bedgraphtobigwig

# create your working directory for your crossmap_bigwig_hg19_to_hg38 environment
    mkdir crossmap_bigwig_hg19_to_hg38                # working directory should be outside the anaconda3 directory
    cd crossmap_bigwig_hg19_to_hg38                   # go to your ucsc-bedgraphtobigwig working directory

# activate conda environment
    conda activate crossmap_bigwig_hg19_to_hg38

# upload your hg19 bigwig files into conda working environment
    # > to  /directory/path/crossmap_bigwig_hg19_to_hg38/

# you need genome liftover file
# genome liftover chain files can be downloaded here: http://hgdownload.cse.ucsc.edu/goldenpath/hg19/liftOver/ (change according to your needs)
# you can also download from here > https://crossmap.sourceforge.net/ 
# Download hg19ToHg38.over.chain.gz and upload into working environment

# this is the command to modify and print your converted file
    CrossMap.py bigwig hg19ToHg38.over.chain.gz file_name_hg19.bw file_name_hg38.bw

# It worked > put .bw file to appropriate folder in remote drive to upload UCSC
    /directory/path/folder_name/

# cp /directory/path/file_name_methylation_CG.bw /directory/path/folder_name/
# go to UCSC account > Custom Tracks > Add custom track
    track type=bigWig name=Sample_name color=0,255,0 bigDataUrl=https://url_name.com/directory/path/file_name_methylation_CG.bw