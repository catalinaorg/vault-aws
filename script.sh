#!/usr/bin/env bash
# check for tools we need
which curl wget unzip jq &>/dev/null || {
  export DEBIAN_FRONTEND=noninteractive
  apt-get update
  apt-get install -y curl wget unzip jq
}
VAULT=$(curl -sL https://releases.hashicorp.com/vault/index.json | jq -r '.versions[].version' | sort -V | egrep -v 'ent|beta|rc|alpha' | tail -n1)
cd /usr/local/bin
wget https://releases.hashicorp.com/vault/${VAULT}/vault_${VAULT}_linux_amd64.zip
unzip -o vault_${VAULT}_linux_amd64.zip
