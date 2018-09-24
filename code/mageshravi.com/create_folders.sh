#!/bin/bash

CYAN='\e[0;36m'
NC='\e[0m'
color=${CYAN}
tag='INFO'

for folder in scripts scss static static/css static/js static/images static/wicons public public/css public/js media
do
    echo -e "${color}[${tag}] Creating folder: ${folder}${NC}"
    mkdir ${folder}
done
echo "DONE"
