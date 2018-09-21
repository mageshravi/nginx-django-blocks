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

# initial setup (as root user)
cd /home/webinative/www
./01_setup_as_root.sh

# continue setup (as webinative user)
su webinative
./02_setup_as_user.sh

# return to root user
exit

# start nginx
service nginx start

```
