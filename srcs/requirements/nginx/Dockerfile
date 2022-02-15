FROM debian:buster

LABEL version = "1" maintainer = "abonte-l <abonte-l@student.42.fr>"

RUN apt-get update \
	&& apt-get upgrade -y \
	&& apt-get install -y \
		nginx \
		openssl \
		curl \
		vim \
		sudo

RUN	rm -f /etc/nginx/nginx.conf
COPY ./tools/nginx.conf /etc/nginx/sites-available/localhost

RUN ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/localhost

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj '/C=FR/ST=IDF/L=Paris/O=42/CN=abonte-l' -keyout /etc/ssl/certs/localhost.key -out /etc/ssl/certs/localhost.crt

EXPOSE 443

HEALTHCHECK --interval=30s --timeout=3s CMD --fail https://127.0.0.1/ || exit 1
CMD [ "nginx", "-g", "daemon off;" ]