# Learning Traefik Configuration and docker-compose


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
    mkdir -p Commons-Server/2020-06-14
    exit

Syncing configs with DO droplet:

    rsync -a --exclude='.git/' ./ commons.dbbs.co:Commons-Server/2020-06-14/

### Start Containers

    ssh root@commons.dbbs.co
    cd Commons-Server/2020-06-14
    docker-compose up -d
