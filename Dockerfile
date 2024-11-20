FROM golang:alpine AS builder

WORKDIR /build

COPY . .

RUN CGO_ENABLED=0 GOOS=linux go build -o ./hello-world .


FROM scratch

COPY --from=builder /build/hello-world /hello-world

EXPOSE 32777

ENTRYPOINT [ "/hello-world"]