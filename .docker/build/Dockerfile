FROM bianjie/irita:v3.0.0

# install openssl
RUN apt-get update && \
apt-get install -y libssl-dev
# install jq
RUN apt-get install -y jq
# install go
RUN apt install -y curl
WORKDIR /tmp
RUN curl -LJO https://go.dev/dl/go1.17.8.linux-amd64.tar.gz
RUN rm -rf /usr/local/go && tar -C /usr/local -xzf /tmp/go1.17.8.linux-amd64.tar.gz
RUN rm /tmp/go1.17.8.linux-amd64.tar.gz
RUN echo "export PATH=$PATH:/usr/local/go/bin" >> ~/.profile
ENV PATH="/usr/local/go/bin:${PATH}"

# 创建 Genesis 文件并启动网络 https://irita.bianjie.ai/docs/installation/deployment.html
RUN mkdir /home/workspace
WORKDIR /home/workspace
ARG PASSPHRASE=tw123456
RUN printf '%s\n' $PASSPHRASE $PASSPHRASE | irita testnet --v 4 --output-dir ./testnet --chain-id=irita-test --home=testnet
