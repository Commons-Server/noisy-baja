apk --update add gettext
chown -R node:node .wiki
su node sh -c "/usr/bin/envsubst < config/config.json > .wiki/config.json"
su node sh -c "/usr/bin/envsubst < config/config.owner.json > .wiki/config.owner.json"
