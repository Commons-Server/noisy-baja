# Learning Traefik Configuration and docker-compose

Here's how I'm syncing configs with DO droplet

    rsync -a --exclude='.git/' ./ commons.dbbs.co:Commons-Server/2020-06-14/
