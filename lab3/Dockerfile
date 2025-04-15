# сборка приложения в первом образе
FROM golang:1.23-alpine AS builder
WORKDIR /app

# копируем только файлы зависимостей
COPY go.mod go.sum ./
RUN apk add --no-cache git && \
    go mod download && \
    apk del git && \
    rm -rf /var/cache/apk/*

# копируем остальной код
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -o /app/main .


# второй образ для запуска
FROM alpine:3.20
WORKDIR /app

# создаем непривилегированного пользователя
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

# установка утилит и очистка кеша
RUN apk add --no-cache ca-certificates libc6-compat && \
    rm -rf /var/cache/apk/* 

# копируем артефакты из первого образа
COPY --from=builder /app/main /app/main
COPY --from=builder /app/migrations /app/migrations

# устанавливаем права для непривилегированного пользователя
RUN chown -R appuser:appgroup /app

USER appuser

EXPOSE 8080

CMD ["/app/main"]