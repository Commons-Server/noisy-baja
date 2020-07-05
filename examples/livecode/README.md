# Example running Livecode adjacent to Federated Wiki

Warning: This example does not actually work as configured.

Best guess is that a hard-coded domain name in the docker-compose.yml
from a domain that is not in the main wiki domain would work okay here.

Sync the configuration to your digital ocean droplet.

    rsync -a --exclude='.git/' ./examples/livecode \
      root@$DOMAIN:Commons-Server/noisy-baja/examples/

Start the livecode service.

    ssh root@$DOMAIN
    cd Commons-Server/noisy-baja
    docker-compose \
      -f docker-compose.yaml \
      -f examples/livecode/docker-compose.yaml \
      up -d livecode
