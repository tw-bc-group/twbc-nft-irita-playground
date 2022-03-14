FROM bianjie/irita:v3.0.0

# install openssl
RUN apt-get update && \
apt-get install -y libssl-dev
RUN irita init node0 --chain-id=irita-test --home=testnet

# 创建 Genesis 文件并启动网络 https://irita.bianjie.ai/docs/installation/deployment.html
ARG PASSPHRASE=tw123456
RUN printf '%s\n' $PASSPHRASE $PASSPHRASE | irita keys add v1
RUN printf '%s\n' $PASSPHRASE | irita add-genesis-account $(irita keys show v1 -a) 1000000000point --home=testnet --root-admin

# 使用步骤4中的私钥文件生成证书请求并申请签发证书 https://irita.bianjie.ai/docs/node_identity_management/cert.html
WORKDIR /tmp
RUN irita genkey --home=testnet --out-file priv.pem
RUN printf '%s\n' "CN" "." "Hong Kong" "ThoughtWorks" "HKMU" "." "." $PASSPHRASE "."  | openssl req -new -key priv.pem -out req.csr -sm3 -sigopt "distid:1234567812345678"
## 生成根证书秘钥
RUN openssl ecparam -genkey -name SM2 -out root.key
## 生成根证书
RUN printf '%s\n' "CN" "." "Hong Kong" "ThoughtWorks" "HKMU" "." "."  | openssl req -new -x509 -sm3 -sigopt "distid:1234567812345678" -key root.key -out root.crt -days 365
## 自签证书
RUN openssl x509 -req -in req.csr -out node0.crt -sm3 -sigopt "distid:1234567812345678" -vfyopt "distid:1234567812345678" -CA root.crt -CAkey root.key -CAcreateserial

# 繼續创建 Genesis 文件并启动网络
RUN irita set-root-cert ca.crt --home=testnet
RUN irita add-genesis-validator --name node0 --cert node0.crt --power 100 --home=testnet --from node0
RUN irita start --home=testnet --pruning=nothing
