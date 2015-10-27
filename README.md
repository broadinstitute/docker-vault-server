docker-vault
============

This is a [Docker][1] image based on the [Phusion Baseimage][2] image to run a [Vault][3] server for serving out secrets.

[![Docker Hub](http://img.shields.io/badge/docker-hub-brightgreen.svg?style=flat)](https://registry.hub.docker.com/u/broadinstitute/vault/)

# Docker Image for the Hashicorp Vault server

https://vaultproject.io/

## Quick Start

Make sure the you have created SSL certificates prior to running the container, since there's no point in having a secure system if you use self-signed certificates!  The container is designed to run with [Consul][4] as the backend datastore, so the machine where this container would run should have [Consul][4] installed and running prior to this container being started.

You can then run one-off commands to start the server, like:

```sh
docker run -p 8200 \
  -v /etc/server.crt:/dev/shm/server.crt:ro \
  -v /etc/server.key:/dev/shm/server.key:ro \
  -v /var/log/vault:/var/log/vault:rw \
  -e VAULT_SERVER=https://vault.example.com \
  -e TOKEN=mysuper-secret-vault-token \
  --cap-add=IPC_LOCK \
  broadinstitute/vault
```

or, you can use docker-compose with a file such as:

```
vault:
  image: broadinstitute/vault:0.3.1
  ports:
    - "8200:8200"
  volumes:
    - /etc/server.crt:/dev/shm/server.crt:ro
    - /etc/server.key:/dev/shm/server.key:ro
    - /var/log/vault:/var/log/vault:rw
  environment:
    VAULT_SERVER: https://vault.example.com
    TOKEN: mysuper-secret-vault-token
  cap_add:
    - IPC_LOCK
```

[1]: https://www.docker.com/ "Docker"
[2]: http://phusion.github.io/baseimage-docker/ "Phusion Baseimage"
[3]: https://vaultproject.io/ "Vault"
[4]: https://www.consul.io/ "Consul"
