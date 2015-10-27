#!/bin/bash

VAULT_SERVER=${VAULT_SERVER:-https://localhost}
SERVER_CRT=${SERVER_CRT:-server.crt}
SERVER_KEY=${SERVER_KEY:-server.key}
CONSUL_AGENT=`/sbin/ip route | awk '/default/ { print $3 }'`
TOKEN=${TOKEN}

sed -i "s;%%VAULT_SERVER%%;${VAULT_SERVER};" "/etc/vault.config"
sed -i "s;%%SERVER_CRT%%;${SERVER_CRT};" "/etc/vault.config"
sed -i "s;%%SERVER_KEY%%;${SERVER_KEY};" "/etc/vault.config"
sed -i "s;%%CONSUL_AGENT%%;${CONSUL_AGENT};" "/etc/vault.config"
sed -i "s;%%TOKEN%%;${TOKEN};" "/etc/vault.config"

/usr/sbin/vault server -config=/etc/vault.config
