build:
	docker build --force-rm . -t "mageshravi.com"

run:
	docker run \
		--name=mageshravi_com \
		-v `pwd`/code:/home/webinative/www \
		-v `pwd`/code/mageshravi.com/mageshravi_com_nginx.conf:/etc/nginx/sites-enabled/mageshravi_com_nginx.conf \
		-v `pwd`/code/notes.mageshravi.com/notes_mageshravi_com_nginx.conf:/etc/nginx/sites-enabled/notes_mageshravi_com_nginx.conf \
		-v `pwd`/code/portfolio.mageshravi.com/portfolio_mageshravi_com_nginx.conf:/etc/nginx/sites-enabled/portfolio_mageshravi_com_nginx.conf \
		-p 8000:8000 \
		-dit mageshravi.com

