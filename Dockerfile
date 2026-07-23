FROM --platform=$BUILDPLATFORM caddy:builder-alpine AS builder

ARG CADDY_VERSION=v2.11.4
ARG PANGOLIN_VERSION=latest
ARG TARGETARCH

RUN GOARCH=${TARGETARCH} xcaddy build "${CADDY_VERSION}" \
    --output /caddy \
    --with github.com/abs3ntdev/caddy-pangolin@${PANGOLIN_VERSION} \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/mholt/caddy-ratelimit

FROM ghcr.io/hotio/caddy:latest

ARG BASE_DIGEST=unknown
ARG PANGOLIN_VERSION=latest
LABEL org.opencontainers.image.source="https://github.com/abs3ntdev/caddy-image" \
      io.abs3ntdev.base-digest="${BASE_DIGEST}" \
      io.abs3ntdev.pangolin-version="${PANGOLIN_VERSION}"

COPY --from=builder /caddy /app/caddy
