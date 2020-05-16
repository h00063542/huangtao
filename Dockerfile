# Create the container from the alpine linux image
FROM alpine:3.7

# Add nginx and nodejs
RUN apk add --update nginx \
    && mkdir -p /var/log/nginx \
    && mkdir -p /var/www/html

COPY nginx_config/nginx.conf /etc/nginx/nginx.conf
COPY nginx_config/default.conf /etc/nginx/conf.d/default.conf
WORKDIR /var/www/html
COPY . .
RUN chown nginx:nginx /var/www/html

CMD ["nginx", "-g", "daemon off;"]
