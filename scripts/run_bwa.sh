#!/bin/bash

set -o errexit
set -o nounset

mkdir -p input output
cp -r efs/input/sample_tumor input/.
bwa-0.7.8/bwa mem efs/GRCh37/GRCh37.fa input/sample_tumor/sequence1.fastq input/sample_tumor/sequence2.fastq > output/sample.bam 2> output/bwa.log
