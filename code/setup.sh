#!/bin/bash

source ./colors.sh

cd /home/webinative
echo -e "${txtblk}${bakcyn}Setting up as ROOT...${txtrst}"
cd /home/webinative/www
source mageshravi.com/create_static_root.sh
source notes.mageshravi.com/create_static_root.sh
source portfolio.mageshravi.com/create_static_root.sh

echo -e "${txtblk}${bakcyn}Setting up as WEBINATIVE...${txtrst}"
su webinative -c 'source ./_run_as_webinative.sh'

echo -e "${txtblk}${bakcyn}Setting up as POSTGRES...${txtrst}"
su postgres -c 'pg_ctlcluster 10 main start'

# create user/role
# su postgres -c 'createuser --no-inherit mravi_web'
# su postgres -c 'createuser --no-inherit notes_mravi_web'
# su postgres -c 'createuser --no-inherit portfolio_mravi_web'

# create db
# su postgres -c 'createdb mageshravi-db'
# su postgres -c 'createdb notes-mageshravi-db'
# su postgres -c 'createdb portfolio-mageshravi-db'

# create linux user with same name
# useradd --no-create-home mravi_web
# useradd --no-create-home notes_mravi_web
# useradd --no-create-home portfolio_mravi_web

echo -e "${txtblk}${bakcyn}Starting up nginx server...${txtrst}"
service nginx start

echo -e "${txtgrn}Done${txtrst}"