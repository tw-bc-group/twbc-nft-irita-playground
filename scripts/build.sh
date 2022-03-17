#!/bin/bash
if ! [ -f node0/irita/config/genesis.json ] || [ ! -z "$FORCE_BUILD" ]; then
  rm -rf /home/nodecluster && mkdir /home/nodecluster && cd /home/nodecluster
  printf '%s\n' $PASSPHRASE $PASSPHRASE | irita testnet --v 4 --output-dir /home/nodecluster --chain-id irita-test --keyring-backend test --starting-ip-address 192.168.10.2
  cat node0/irita/config/genesis.json | jq '.app_state.perm.role_accounts+= [{"address": "iaa15qgqfqk8uuej8ykjcyf7nse5n2avph0m92cu4e","roles": ["ROOT_ADMIN"]}]'| jq '.app_state.auth.accounts+= [{"@type": "/cosmos.auth.v1beta1.BaseAccount","address":"iaa15qgqfqk8uuej8ykjcyf7nse5n2avph0m92cu4e"}]' | jq '.app_state.bank.balances+= [{"address":"iaa15qgqfqk8uuej8ykjcyf7nse5n2avph0m92cu4e","coins":[{"denom":"upoint","amount":"1000000000000000"}]}]' > genesis_temp.json
  cp genesis_temp.json node0/irita/config/genesis.json
  cp genesis_temp.json node1/irita/config/genesis.json
  cp genesis_temp.json node2/irita/config/genesis.json
  cp genesis_temp.json node3/irita/config/genesis.json
  rm genesis_temp.json
  
  echo "Faucet address: iaa15qgqfqk8uuej8ykjcyf7nse5n2avph0m92cu4e"
  echo "Faucet coin amount: 1000000000000point"
  echo "Faucet key seed: tube lonely pause spring gym veteran know want grid tired taxi such same mesh charge orient bracket ozone concert once good quick dry boss"
else
  echo "Build already exists!"
  echo "Faucet address: iaa15qgqfqk8uuej8ykjcyf7nse5n2avph0m92cu4e"
fi
