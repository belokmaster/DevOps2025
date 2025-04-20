FROM system AS build

WORKDIR /app

COPY go.mod go.sum ./    
RUN go mod download

COPY . .

RUN mkdir -p /app/bin && \
    CGO_ENABLED=0 GOOS=linux go build -o /app/bin/app

RUN chown -R appuser:appuser /app
USER appuser
