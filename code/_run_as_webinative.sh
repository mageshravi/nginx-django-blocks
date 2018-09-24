#!/bin/bash

source ./colors.sh

# create virtualenvs
echo -e "${txtblk}${bakpur}Creating virtualenvs...${txtrst}"
cd /home/webinative
echo -e "${txtpur}com.mageshravi.venv${txtrst}"
virtualenv com.mageshravi.venv
echo -e "${txtpur}com.mageshravi.notes.venv${txtrst}"
virtualenv com.mageshravi.notes.venv
echo -e "${txtpur}com.mageshravi.portfolio.venv${txtrst}"
virtualenv com.mageshravi.portfolio.venv

# install pip packages
echo -e "${txtblk}${bakpur}Installing pip packages...${txtrst}"
echo -e "${txtpur}mageshravi.com${txtrst}"
cd /home/webinative/com.mageshravi.venv/bin/
./pip install -r /home/webinative/www/mageshravi.com/pip-requirements
echo -e "${txtpur}notes.mageshravi.com${txtrst}"
cd /home/webinative/com.mageshravi.notes.venv/bin/
./pip install -r /home/webinative/www/notes.mageshravi.com/pip-requirements
echo -e "${txtpur}portfolio.mageshravi.com${txtrst}"
cd /home/webinative/com.mageshravi.portfolio.venv/bin/
./pip install -r /home/webinative/www/portfolio.mageshravi.com/pip-requirements

# start uwsgi processes
echo -e "${txtblk}${bakylw}Starting uwsgi processes...${txtrst}"
echo -e "${txtpur}mageshravi.com${txtrst}"
cd /home/webinative/www/mageshravi.com
/home/webinative/com.mageshravi.venv/bin/uwsgi --ini mageshravi_com_uwsgi.ini &
echo -e "${txtpur}notes.mageshravi.com${txtrst}"
cd /home/webinative/www/notes.mageshravi.com
/home/webinative/com.mageshravi.notes.venv/bin/uwsgi --ini notes_mageshravi_com_uwsgi.ini &
echo -e "${txtpur}portfolio.mageshravi.com${txtrst}"
cd /home/webinative/www/portfolio.mageshravi.com
/home/webinative/com.mageshravi.portfolio.venv/bin/uwsgi --ini portfolio_mageshravi_com_uwsgi.ini &
