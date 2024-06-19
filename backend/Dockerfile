FROM golang:1.21 as builder

WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download

COPY . .

RUN go build -o secretservice .

# Start new stage from scratch
FROM alpine:latest  

WORKDIR /root/

COPY --from=builder /app/secretservice .

CMD ["./secretservice", "--secret", "something-super-secret", "--debug.addr", ":7070"]

EXPOSE 80 7070