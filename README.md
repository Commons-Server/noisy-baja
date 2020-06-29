# Noisy Baja

A playground for learning how to configure a combination of Federated
Wiki, Traefik load-balancer, and docker-compose to tie them
together. Some chance this will grow to become the basis of a
full-featured commons wiki server, but we confine ourselves to a
sandbox for now to build some confidence in the configurations and
abstractions we discover.

# Bootstrapping

### Droplet

Created a Digital Ocean droplet with the docker template from the
marketplace.  https://marketplace.digitalocean.com/apps/docker

### DNS
Created an A record for sub-domain (in my case commons.dbbs.co) to the
IP of new droplet.

Created a companion wildcard CNAME (*.commons.dbbs.co) pointed at the
sub-domain.

Created an API token
(https://cloud.digitalocean.com/account/api/tokens).  Saved the token
in `./keys/do-auth-token`. For good measure also limited the file
permissions like so:

    chmod 600 ./keys/do-auth-token

This token does get rsync'd to the droplet so the traefik
load-balancer can use it for Let's Encrypt's DNS-based challenge.

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
