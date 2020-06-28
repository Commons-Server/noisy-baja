# Lazy Baja

A playground for learning Traefik configuration and docker-compose.
Some chance this will grow up to become the basis for a commons wiki
server, but we confine ourselves to a sandbox for now to build some
confidence in the abstractions we discover.

# Bootstrapping

### Droplet

Created a Digital Ocean droplet with the docker template from the marketplace.
https://marketplace.digitalocean.com/apps/docker

### DNS
Created an A record for sub-domain (in my case commons.dbbs.co) to the
IP of new droplet.

Created a companion wildcard CNAME (*.commons.dbbs.co) pointed at the sub-domain.

### Config

    ssh root@commons.dbbs.co
    mkdir -p Commons-Server/noisy-baja
    exit

Syncing configs with DO droplet:

    cp .env.example .env
    # edited .env to set DOMAIN commons.dbbs.co (use your own domain name)
    # and the email address I use for letsencrypt
    rsync -a --exclude='.git/' ./ commons.dbbs.co:Commons-Server/noisy-baja/

### Start Containers

    ssh root@commons.dbbs.co
    cd Commons-Server/noisy-baja
    docker-compose up -d
    exit

### Test

    https://whoami.commons.dbbs.co
