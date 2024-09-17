# Builder stage - builds the server
FROM golang:1.23.1 AS builder
WORKDIR /src
COPY main.go /src/
COPY go.mod /src/
RUN CGO_ENABLED=0 GOOS=linux go build -o /app/go-http-server

# Uses scratch image to run the server
FROM scratch
WORKDIR /app
COPY --from=builder /app/go-http-server .
EXPOSE 8080
CMD [ "/app/go-http-server" ]
