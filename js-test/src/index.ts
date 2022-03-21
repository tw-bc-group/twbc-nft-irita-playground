//@ts-ignore
import { newClient } from "../lib/irita-sdk-js";
//@ts-ignore
import { Network } from "../lib/irita-sdk-js/src/types/constants";
import util from "util";

const testConfig = {
  node: "http://47.100.192.234:26657",
  network: Network.Testnet,
  chainId: "testing",
};
const config = {
  node:
    "https://opbningxia.bsngate.com:18602/api/9494b8475f1f4c3cb8fa48b311d56652/rpc",
  network: Network.Mainnet,
  chainId: "wenchangchain",
  rpcConfig: {
    headers: {
      "x-api-key": "9ea8dae373764bd294e7345e15a23a8d",
    },
  },
};
const inspect = (obj) => util.inspect(obj, false, null, true);

const main = async () => {
  const client = newClient(config);
  // console.log(inspect(await client.token.queryTokens());
  // console.log(inspect(await client.nft.queryDenoms()));
  // console.log(inspect(await client.nft.queryOwner('iaa1aq7yhgwvwc64ppejnlx4dp7h3aegtf7tat9mh0')));
  // console.log(inspect(await client.nft.queryDenom('denom80cbefedbd6a468bbc8d184601f88cda')));
  console.log(inspect(await client.nft.queryCollection('denom80cbefedbd6a468bbc8d184601f88cda')));
  // console.log(inspect(await client.nft.queryNFT('denom098b118390d34fad907aba489dac963a', 'daw9aaab77ad5ab4dc989eaeea38ccb4311')));
};

main();
