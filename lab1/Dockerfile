FROM alpine:3.20

# Установка nginx, создание пользователя, создание рабочих папок, установка прав на директории
RUN apk add --no-cache nginx && \ 
    adduser -D -G nginxuser nginxuser && \
    mkdir -p /var/www/html && chown -R nginxuser:nginxuser /var/www/html && \
    chown -R nginxuser:nginxuser /var/log/nginx /var/lib/nginx /var/run/nginx

# Определение внешнего тома для статических файлов
VOLUME /var/www/html

# Копирование конфига
COPY ./nginx.conf /etc/nginx/nginx.conf

EXPOSE 8080

# Переключение на пользователя
USER nginxuser

CMD [ "nginx", "-g", "daemon off;" ]
