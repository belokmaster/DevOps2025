FROM alpine:3.16

WORKDIR /app

COPY --from=go-build /app/bin/app .

RUN adduser -D appuser && \
    chown -R appuser:appuser /app

USER appuser

ENV APP_PORT=8080

EXPOSE $APP_PORT

CMD ["./app"]
