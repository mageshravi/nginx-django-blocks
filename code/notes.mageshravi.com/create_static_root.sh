#!/bin/bash

# creates the static root on PRODUCTION environment

CYAN='\e[0;36m'
NC='\e[0m'
color=${CYAN}
tag='INFO'

STATIC_ROOT=/var/www/notes.mageshravi.com

echo -e "${color}[${tag}] Creating static root at ${STATIC_ROOT}...${NC}"
mkdir -p ${STATIC_ROOT}

echo -e "${color}[${tag}] Setting permissions...${NC}"
chown -R root:webinative ${STATIC_ROOT}
chmod -R 0775 ${STATIC_ROOT}