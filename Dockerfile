FROM nginx:1.17.1-alpine
RUN adduser -D -H -u 1000 -s /bin/bash www-data -G www-data
EXPOSE 80/tcp
EXPOSE 443/tcp
CMD ["/bin/sh", "-c", "exec nginx -g 'daemon off;';"]
WORKDIR /usr/share/nginx/html
