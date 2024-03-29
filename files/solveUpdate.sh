#!/bin/sh -e

tmp="$(mktemp)"
sudo apt-get update 2>&1 | sed -En 's/.*NO_PUBKEY ([[:xdigit:]]+).*/\1/p' | sort -u > "${tmp}" 
cat "${tmp}" | xargs sudo gpg --keyserver "hkps://keyserver.ubuntu.com:443" --recv-keys 
cat "${tmp}" | xargs -L 1 sh -c 'sudo gpg --yes --output "/etc/apt/trusted.gpg.d/$1.gpg" --export "$1"' sh 
rm "${tmp}"