# Build the config
`./batect build`
## Enable swagger
`Modify build/nodecluster/node0/irita/config/app.toml api.swagger=true`

# Start the nodes
`docker-compose up --build -d`
## Recover keys from key seeds
`bash /scripts/recover.sh`
## Issue a token
`irita tx token issue --name "Kitty Token" --symbol "kitty" --min-unit="kitty" --scale 0 --initial-supply 100000000000 --max-supply 1000000000000 --mintable true --from v1 --chain-id irita-test --home node0/iritacli --keyring-backend test --node tcp://192.168.10.2:26657`
