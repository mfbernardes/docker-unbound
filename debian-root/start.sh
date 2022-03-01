#!/bin/sh


echo "Preparing unbound..."
/usr/lib/unbound/package-helper chroot_setup
/usr/lib/unbound/package-helper root_trust_anchor_update

echo "Starting unbound"
/usr/sbin/unbound -d -c /etc/unbound/unbound.conf

