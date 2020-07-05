# Install Hard-coded Wiki Config

Here we offer an example that uses docker compose to install a wiki
`config.json` file.

Sync the configuration to your digital ocean droplet.

    cd ./examples/hard-coded
    rsync -a --exclude='.git/' ./ \
      root@$DOMAIN:Commons-Server/noisy-baja/examples/hard-coded/

Run the docker compose to install the config file.

    ssh root@$DOMAIN
    cd Commons-Server/noisy-baja
    docker-compose \
      -f docker-compose.yaml \
      -f examples/hard-coded/docker-compose.yaml \
      run --rm config
