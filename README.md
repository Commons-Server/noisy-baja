# Noisy Baja

A playground for learning Traefik configuration and docker-compose.
Some chance this will grow up to become the basis for a commons wiki
server, but we confine ourselves to a sandbox for now to build some
confidence in the abstractions we discover.

# Bootstrapping

### Droplet

Created a Digital Ocean droplet with the docker template from the
marketplace.  https://marketplace.digitalocean.com/apps/docker

### DNS
Created an A record for sub-domain (in my case commons.dbbs.co) to the
IP of new droplet.

Created a companion wildcard CNAME (*.commons.dbbs.co) pointed at the
sub-domain.

### Config

We will setup the example using friends security. Replace all the
values in the `environment` stanza in
`examples/friends/docker-compose.yaml` with your own DOMAIN,
COOKIE_SECRET, AUTHOR and PASSWORD. Then rsync the configs to the
digital ocean droplet.

    ssh root@$DOMAIN mkdir -p Commons-Server/noisy-baja
    rsync -a --exclude='.git/' ./ root@$DOMAIN:Commons-Server/noisy-baja/

Install the friends configuration

    ssh root@$DOMAIN
    cd Commons-Server/noisy-baja
    docker-compose \
      -f docker-compose.yaml \
      -f examples/friends/docker-compose.yaml \
      run --rm config
    exit

### Start Containers

    ssh root@$DOMAIN \
      "cd Commons-Server/noisy-baja; docker-compose up -d"

### Test

Try visiting these sites to confirm the installation worked.

* https://whoami.$DOMAIN
* https://wiki.$DOMAIN
