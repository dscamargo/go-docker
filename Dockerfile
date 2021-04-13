FROM golang:1.16-alpine as builder

WORKDIR /go/src/
COPY . .
RUN GOOS=linux CGO_ENABLED=0 go build -o server main.go

FROM scratch
WORKDIR /go/
COPY --from=builder /go/src /go
CMD ["/go/server"]