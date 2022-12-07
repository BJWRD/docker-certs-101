FROM nginx
MAINTAINER BJWRD "brad.whitcomb97@gmail.com" # Change the name and email address accordingly

COPY nginx.conf /etc/nginx/conf.d/nginx.conf
