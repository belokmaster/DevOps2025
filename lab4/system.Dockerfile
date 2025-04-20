# system - базовый образ со всеми зависимостями для сборки
FROM golang:1.23.5-alpine AS system

WORKDIR /app

# Устанавливаем все необходимые для сборки зависимости
RUN apk add --no-cache \
    git \
    gcc \
    musl-dev

# Создаем непривилегированного пользователя
RUN adduser -D appuser