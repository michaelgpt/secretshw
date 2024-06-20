FROM golang:1.21

WORKDIR /app

COPY go.* ./
RUN go mod download

COPY . ./

RUN CGO_ENABLED=0 GOOS=linux go build -o /secretservice

EXPOSE 8080

CMD ["/secretservice", "--secret", "something-super-secret", "--debug.addr", "localhost:7070"]