FROM alpine:latest

RUN apk add --no-cache nginx && \
    mkdir -p /var/lib/nginx/tmp /var/lib/nginx/logs /var/run/nginx && \
    adduser -D -g 'www' www && \
    chown -R www:www /var/lib/nginx /var/log/nginx /var/run/nginx

COPY nginx.conf /etc/nginx/nginx.conf
COPY html /var/www/html

USER www

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]