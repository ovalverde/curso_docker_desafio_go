FROM golang:1.18-alpine AS builder

WORKDIR /usr/src/app

COPY main.go .
RUN go build -o /usr/local/bin/app main.go

FROM scratch

WORKDIR /usr/local/bin
COPY --from=builder  /usr/local/bin/app .
CMD ["app"]