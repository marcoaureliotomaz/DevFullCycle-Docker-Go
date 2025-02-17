FROM golang:alpine as builder

WORKDIR /go/src/app

COPY . .

RUN CGO_ENABLED=0 GOOS=linux go build -ldflags="-s -w" -o /app main.go

FROM scratch

COPY --from=builder /app /app

CMD ["/app"]