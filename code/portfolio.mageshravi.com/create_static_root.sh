#!/bin/bash

source ../colors.sh

# creates the static root on PRODUCTION environment

STATIC_ROOT=/var/www/portfolio.mageshravi.com

echo -e "Creating static root at ${txtcyn}${STATIC_ROOT}${txtrst}..."
mkdir -p ${STATIC_ROOT}

echo -e "Setting permissions...${NC}"
chown -R root:webinative ${STATIC_ROOT}
chmod -R 0775 ${STATIC_ROOT}