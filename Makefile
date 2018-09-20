build:
	docker build --force-rm . -t "mageshravi.com"

run:
	docker run --name=mageshravi_com -v `pwd`/code:/home/webinative/mageshravi.com -dit mageshravi.com
