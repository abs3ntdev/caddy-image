FROM --platform=$BUILDPLATFORM golang:alpine AS builder

ARG TARGETARCH
WORKDIR /src

COPY go.mod go.sum ./
RUN go mod download

COPY main.go ./
RUN CGO_ENABLED=0 GOOS=linux GOARCH=${TARGETARCH} \
    go build -trimpath -ldflags "-s -w" -o /caddy .

FROM ghcr.io/hotio/caddy:latest

ARG BASE_DIGEST=unknown
LABEL org.opencontainers.image.source="https://github.com/abs3ntdev/caddy-image" \
      io.abs3ntdev.base-digest="${BASE_DIGEST}"

COPY --from=builder /caddy /app/caddy
