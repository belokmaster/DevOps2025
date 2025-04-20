FROM golang:1.23.5-alpine AS system

WORKDIR /app

RUN apk add --no-cache \
    git \
    gcc \
    musl-dev

RUN adduser -D appuser