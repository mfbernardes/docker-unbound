# docker-unbound
Unbound docker container based on plain Debian

Inspired by Pi-hole documentation: https://docs.pi-hole.net/guides/dns/unbound/

## Supported use case:
 * Host network
 * Port 5553
 * IPv6 Enabled

For anything else you can provide your own /etc/unbound/unbound.conf.d/server.conf

## License

See the LICENSE file.

## TODO

- [ ] Enable/disable IPv6 based on env var
- [ ] Configure listening port
- [ ] Compose file including pihole

