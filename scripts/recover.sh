#!/bin/bash
cat node0/iritacli/key_seed.json | jq ".secret" -r | irita keys add node0 --recover --keyring-backend test
cat node1/iritacli/key_seed.json | jq ".secret" -r | irita keys add node1 --recover --keyring-backend test
cat node2/iritacli/key_seed.json | jq ".secret" -r | irita keys add node2 --recover --keyring-backend test
cat node3/iritacli/key_seed.json | jq ".secret" -r | irita keys add node3 --recover --keyring-backend test
echo tube lonely pause spring gym veteran know want grid tired taxi such same mesh charge orient bracket ozone concert once good quick dry boss | irita keys add v1 --recover --keyring-backend test
