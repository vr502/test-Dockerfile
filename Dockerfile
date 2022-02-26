FROM centos:7
RUN \
	yum -y install \
		httpd \
		php \
		php-cli \
		php-common \
		openssl \
		mod_ssl 

RUN echo "<? phpinfo(); ?>" > /var/www/html/hola.php

COPY startbootstrap-sb-admin-2 /var/www/html
COPY ssl.conf /etc/httpd/conf.d/default.conf
COPY docker.crt /docker.crt
COPY docker.key /docker.key

EXPOSE 443

CMD apachectl -DFOREGROUND
