# create virtualenvs

cd /home/webinative
virtualenv com.mageshravi.venv
virtualenv com.mageshravi.notes.venv
virtualenv com.mageshravi.portfolio.venv

# install pip packages

cd /home/webinative/com.mageshravi.venv/bin/
./pip install -r /home/webinative/www/mageshravi.com/pip-requirements
cd /home/webinative/com.mageshravi.notes.venv/bin/
./pip install -r /home/webinative/www/notes.mageshravi.com/pip-requirements
cd /home/webinative/com.mageshravi.portfolio.venv/bin/
./pip install -r /home/webinative/www/portfolio.mageshravi.com/pip-requirements

# start uwsgi processes

cd /home/webinative/www/mageshravi.com
/home/webinative/com.mageshravi.venv/bin/uwsgi --ini mageshravi_com_uwsgi.ini &
cd /home/webinative/www/notes.mageshravi.com
/home/webinative/com.mageshravi.notes.venv/bin/uwsgi --ini notes_mageshravi_com_uwsgi.ini &
cd /home/webinative/www/portfolio.mageshravi.com
/home/webinative/com.mageshravi.portfolio.venv/bin/uwsgi --ini portfolio_mageshravi_com_uwsgi.ini &
