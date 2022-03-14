FROM bianjie/irita:v3.0.0

# install openssl
RUN apt-get update && \
apt-get install -y libssl-dev

# install jq
RUN apt-get install -y jq

RUN mkdir /home/nodecluster
WORKDIR /home/nodecluster
