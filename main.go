package main

import (
	caddycmd "github.com/caddyserver/caddy/v2/cmd"

	_ "github.com/caddyserver/caddy/v2/modules/standard"

	_ "github.com/abs3ntdev/caddy-pangolin"
	_ "github.com/caddy-dns/cloudflare"
	_ "github.com/darkweak/souin/plugins/caddy"
	_ "github.com/gfx-labs/swim/plugin"
	_ "github.com/mholt/caddy-ratelimit"
)

func main() {
	caddycmd.Main()
}
