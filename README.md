# caddy-image

Custom Caddy Docker image based on [hotio/caddy](https://hotio.dev/containers/caddy/).
Caddy is built as a plain Go program: `main.go` blank-imports the plugins,
versions are pinned in `go.mod`.

Included plugins:

- [caddy-pangolin](https://github.com/abs3ntdev/caddy-pangolin)
- [caddy-dns/cloudflare](https://github.com/caddy-dns/cloudflare)
- [darkweak/souin](https://github.com/darkweak/souin) (HTTP cache)
- [gfx-labs/swim](https://github.com/gfx-labs/swim) (vfs, mergefs, localfs, prerender, github_preview)
- [mholt/caddy-ratelimit](https://github.com/mholt/caddy-ratelimit)

## Usage

```sh
docker pull ghcr.io/abs3ntdev/caddy-image:latest
```

Tags: `latest` and the Caddy version (e.g. `v2.11.4`).

## Adding a plugin

1. Add a blank import to `main.go`:

   ```go
   _ "github.com/example/some-caddy-plugin"
   ```

2. Resolve and pin it:

   ```sh
   go get github.com/example/some-caddy-plugin && go mod tidy
   ```

3. Commit and push — the workflow rebuilds and publishes the image.

To pin or bump a specific plugin version, use `go get module@version`.

## How it rebuilds

- Pushes to `main` (including merged dependabot bumps of Caddy or any plugin)
  always rebuild.
- A daily scheduled run rebuilds only when the `ghcr.io/hotio/caddy:latest`
  base image digest changes.
- Dependabot checks Go dependencies daily, so new plugin releases arrive as PRs.
