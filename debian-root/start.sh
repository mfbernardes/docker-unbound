#!/bin/sh

UNBOUND_CONF=/etc/unbound/unbound.conf

echo "Setting up keys..."
/usr/lib/unbound/package-helper root_trust_anchor_update

echo "Starting unbound"
/usr/sbin/unbound -d -c ${UNBOUND_CONF}
