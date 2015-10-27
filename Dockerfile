FROM phusion/baseimage:0.9.17

ENV VAULT_VERSION 0.3.1

EXPOSE 8200

RUN apt-get update && \
    apt-get install -y wget zip && \
    cd /tmp && \
    wget https://dl.bintray.com/mitchellh/vault/vault_${VAULT_VERSION}_linux_amd64.zip && \
    unzip vault_${VAULT_VERSION}_linux_amd64.zip && \
    mv vault /usr/sbin/ && \
    mkdir -p /etc/service/vault
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD vault.config /etc/

ADD run.sh /etc/service/vault/run

RUN chmod 0755 /etc/service/vault/run
