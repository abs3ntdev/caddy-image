# caddy-image

Custom Caddy Docker image based on [hotio/caddy](https://hotio.dev/containers/caddy/)
with the following plugins baked in:

- [caddy-pangolin](https://github.com/abs3ntdev/caddy-pangolin)
- [caddy-dns/cloudflare](https://github.com/caddy-dns/cloudflare)
- [mholt/caddy-ratelimit](https://github.com/mholt/caddy-ratelimit)

## Usage

```sh
docker pull ghcr.io/abs3ntdev/caddy-image:latest
```

Tags: `latest` and the Caddy version (e.g. `v2.11.4`).

## How it rebuilds

A daily scheduled workflow rebuilds and pushes the image when either:

- the `ghcr.io/hotio/caddy:latest` base image digest changes, or
- a new release of caddy-pangolin is published on the Go module proxy

Pushes to `main` and manual dispatch always rebuild.
