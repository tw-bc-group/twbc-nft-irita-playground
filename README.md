# Build the config
```
./batect build
```
## Enable swagger
```
Modify build/nodecluster/node0/irita/config/app.toml api.swagger=true
```

# CLI
## Test locally
### Prerequisites
#### Start the nodes
```
docker-compose up --build -d
```
#### Run bash from node0
```
docker exec -it irita-workspace /bin/bash
```
#### Recover keys from key seeds (must do this every time you restart the container)
```
bash /scripts/recover.sh
```
### Inside the docker container
#### Issue a token
```
irita tx token issue --name "Kitty Token" --symbol "kitty" --min-unit="kitty" --scale 0 --initial-supply 100000000000 --max-supply 1000000000000 --mintable true --from v1 --chain-id irita-test --home node0/iritacli --keyring-backend test --node tcp://192.168.10.2:26657
```
#### List all tokens
```
irita query token tokens --node tcp://192.168.10.2:26657
```

#### Issue nft
```
irita tx nft issue thoughtworks --schema='{"title":"Asset Metadata","type":"object","properties":{"name":{"type":"string","description":"Identifies the asset to which this NFT represents"},"description":{"type":"string","description":"Describes the asset to which this NFT represents"},"image":{"type":"string","description":"A URI pointing to a resource with mime type image/* representing the asset to which this NFT represents. Consider making any images at a width between 320 and 1080 pixels and aspect ratio between 1.91:1 and 4:5 inclusive."},"meta":{"type":"string","description":"A URI pointing to other attributes related to the asset to which this NFT represents"}}}' --from v1 --chain-id=irita-test --home node0/iritacli --keyring-backend test --node tcp://192.168.10.2:26657 --mint-restricted --update-restricted
```
#### Mint nft
```
irita tx nft mint thoughtworks a4c74c4203af41619d00bb3e2f462c10 --uri http://192.168.10.7/thoughtworks.json --data '{"name":"thoughtworks","description":"thoughtworks logo","image":"https://www.thoughtworks.com/etc.clientlibs/thoughtworks/clientlibs/clientlib-site/resources/images/thoughtworks-logo.svg"}' --from=v1 --chain-id=irita-test --home=node0/iritacli --node tcp://192.168.10.2:26657 --keyring-backend test
```
#### Query all nft under v1
```
irita query nft owner iaa15qgqfqk8uuej8ykjcyf7nse5n2avph0m92cu4e --chain-id=irita-test --home node0/iritacli --node tcp://192.168.10.2:26657
```

## Connect to our wenchangchain
### Prerequisites
#### Start docker container
```
./batect start
```
### Inside the docker container
#### issue a token
```
irita tx token issue --name "Kitty Token" --symbol "kitty" --min-unit="kitty" --scale 0 --initial-supply 100000000000 --max-supply 1000000000000 --mintable true --from v1 --node https://opbningxia.bsngate.com:18602/api/{project_id}/rpc --chain-id wenchangchain
```
#### List all tokens
```
irita query token tokens --node https://opbningxia.bsngate.com:18602/api/{project_id}/rpc --chain-id wenchangchain
```
#### List all nft denoms
```
irita query nft denoms --node https://opbningxia.bsngate.com:18602/api/{project_id}/rpc --chain-id wenchangchain
```

# API
## NFT related
### List all denom
```
curl -X GET "http://localhost:1317/irismod/nft/denoms"
```
### List detail of a denom
```
curl -X GET "http://localhost:1317/irismod/nft/denoms/thoughtworks"
```
### List all NFTs
```
curl -X GET "http://localhost:1317/irismod/nft/nfts"
```
### Get nft under denom and owner
```
curl -X GET "http://localhost:1317/irismod/nft/nfts?denom_id=thoughtworks&owner=iaa15qgqfqk8uuej8ykjcyf7nse5n2avph0m92cu4e"
```
### Get details of a NFT assset
```
curl -X GET "http://localhost:1317/irismod/nft/nfts/thoughtworks/a4c74c4203af41619d00bb3e2f462c10"
```
