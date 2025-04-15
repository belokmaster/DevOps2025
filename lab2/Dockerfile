FROM golang:1.23-alpine AS builder

WORKDIR /app

# Устанавливаем зависимости для MySQL
RUN apk add --no-cache gcc musl-dev

COPY go.mod go.sum ./
RUN go mod download

COPY . .

RUN CGO_ENABLED=0 GOOS=linux go build -o /app/main .

FROM alpine:3.20

WORKDIR /app

# Создаем непривилегированного пользователя
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

# Устанавливаем только необходимые пакеты для runtime
RUN apk add --no-cache ca-certificates libc6-compat

# Копируем бинарник
COPY --from=builder /app/main /app/main
COPY --from=builder /app/migrations /app/migrations

# Устанавливаем права для непривилегированного пользователя
RUN chown -R appuser:appgroup /app

USER appuser

EXPOSE 8080

CMD ["/app/main"]