FROM nginx:1.17.1-alpine
RUN adduser -D -H -u 1000 -s /bin/bash www-data -G www-data
#RUN addgroup -g 1000 -S www-data && adduser -D -H -u 1000 -s /bin/bash www-data -G www-data
#COPY reverse_proxy.conf /etc/nginx/conf.d
#COPY ssl/* /etc/ssl/
EXPOSE 80/tcp
EXPOSE 443/tcp
CMD ["/bin/sh", "-c", "exec nginx -g 'daemon off;';"]
WORKDIR /usr/share/nginx/html
