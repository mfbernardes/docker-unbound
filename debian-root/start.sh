#!/bin/sh

UNBOUND_CONF=/etc/unbound/unbound.conf

VERBOSITY=${VERBOSITY:-0}

LISTEN_IPV4=${LISTEN_IPV4:-127.0.0.1}
LISTEN_IPV6=${LISTEN_IPV6:-::1}
LISTEN_PORT=${LISTEN_PORT:-5553}


ALLOW_SUBNETS=${ALLOW_SUBNETS:-""}

DISABLE_IPV4=${DISABLE_IPV4:-yes}
ENABLE_IPV6=${ENABLE_IPV6:-no}

SO_RCVBUF=${SO_RCVBUF:-0}
SO_REUSEPORT=${SO_REUSEPORT:-no}


echo "Generating configuration..."

eval "echo \"$(cat /etc/unbound/unbound.conf.tmpl)\"" > ${UNBOUND_CONF}

set -- $ALLOW_SUBNETS
while [ -n "$1" ]; do
  echo "    access-control: $1 allow"
  shift
done >> ${UNBOUND_CONF}


echo "Setting up keys..."
/usr/lib/unbound/package-helper root_trust_anchor_update

echo "Starting unbound"
/usr/sbin/unbound -d -c ${UNBOUND_CONF}
