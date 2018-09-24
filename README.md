# nginx-django-blocks

Docker config staging multiple websites (django apps) in various subdomains (nginx server blocks).

## How to run

```bash
# build container
make build

# run container
make run

# attach container to shell
docker attach mageshravi_com

# setup
cd /home/webinative/www
./setup.sh
```
