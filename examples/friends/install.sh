apk --update add gettext
su node sh -c "/usr/bin/envsubst < config/config.json > .wiki/config.json"
su node sh -c "/usr/bin/envsubst < config/config.owner.json > .wiki/config.owner.json"
