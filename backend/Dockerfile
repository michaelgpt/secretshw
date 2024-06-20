FROM golang:1.21 as builder

WORKDIR /app

COPY go.* ./
RUN go mod download

COPY . ./

RUN go build -v -o secretservice

# Start new stage from scratch
FROM alpine:latest  

WORKDIR /root/

COPY --from=builder /app/secretservice /app/secretservice

CMD ["/app/secretservice", "--secret", "something-super-secret", "--debug.addr", "localhost:7070"]

EXPOSE 80 7070