FROM debian:latest
RUN apt-get -y update && apt-get -y upgrade && \
    apt-get install nginx -y && \
    apt-get autoclean && rm -rf /var/www/*
COPY index.html /var/www/bangbang.net/index.html
COPY 1.jpg /var/www/bangbang.net/img/1.jpg
RUN chmod 764 /var/www/bangbang.net
RUN useradd Semen && \
    groupadd Philimonoff && \
    usermod -a -G Philimonoff Semen
RUN chown Semen:Philimonoff /var/www/bangbang.net
RUN sed -i 's|/var/www/html|/var/www/bangbang.net|g' /etc/nginx/sites-enabled/default
RUN sed -i 's|user www-data|user Semen|g' etc/nginx/nginx.conf