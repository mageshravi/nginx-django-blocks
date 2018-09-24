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

# create db
echo -e "${txtblk}${bakylw}Creating databases...${txtrst}"
echo -ne "${txtylw}mravi_db ${txtrst}"
su postgres -c "psql -c \"create database mravi_db;\""
echo -ne "${txtylw}notes_mravi_db ${txtrst}"
su postgres -c "psql -c \"create database notes_mravi_db;\""
echo -ne "${txtylw}portfolio_mravi_db ${txtrst}"
su postgres -c "psql -c \"create database portfolio_mravi_db;\""

# revoke the default permissions (psql)
echo -e "${txtblk}${bakylw}Revoking default permissions...${txtrst}"
echo -ne "${txtylw}mravi_db ${txtrst}"
su postgres -c "psql -c \"revoke all privileges on database mravi_db from public;\""
echo -ne "${txtylw}notes_mravi_db ${txtrst}"
su postgres -c "psql -c \"revoke all privileges on database notes_mravi_db from public;\""
echo -ne "${txtylw}portfolio_mravi_db ${txtrst}"
su postgres -c "psql -c \"revoke all privileges on database portfolio_mravi_db from public;\""

# create new users (psql)
echo -e "${txtblk}${bakylw}Creating database users...${txtrst}"
echo -ne "${txtylw}mravi_web ${txtrst}"
su postgres -c "psql -c \"create user mravi_web with password 'mravi_pwd';\""
echo -ne "${txtylw}notes_mravi_web ${txtrst}"
su postgres -c "psql -c \"create user notes_mravi_web with password 'notes_mravi_pwd';\""
echo -ne "${txtylw}portfolio_mravi_web ${txtrst}"
su postgres -c "psql -c \"create user portfolio_mravi_web with password 'portfolio_mravi_pwd';\""

# grant permissions
echo -e "${txtblk}${bakylw}Granting privileges to newly created users...${txtrst}"
echo -ne "${txtylw}mravi_web => mravi_db ${txtrst}"
su postgres -c "psql -c \"grant all privileges on database mravi_db to mravi_web;\""
echo -ne "${txtylw}notes_mravi_web => notes_mravi_db ${txtrst}"
su postgres -c "psql -c \"grant all privileges on database notes_mravi_db to notes_mravi_web;\""
echo -ne "${txtylw}portfolio_mravi_web => portfolio_mravi_db ${txtrst}"
su postgres -c "psql -c \"grant all privileges on database portfolio_mravi_db to portfolio_mravi_web;\""

# create linux users with same name
echo -e "${txtblk}${bakylw}Creating operating system users...${txtrst}"
useradd --no-create-home mravi_web
useradd --no-create-home notes_mravi_web
useradd --no-create-home portfolio_mravi_web

echo -e "${txtblk}${bakcyn}Starting up nginx server...${txtrst}"
service nginx start

echo -e "${txtgrn}Done${txtrst}"