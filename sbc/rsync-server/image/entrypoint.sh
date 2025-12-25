#!/bin/sh

# 1. Set Default Values if the user doesn't provide them
PUID=${PUID:-1000}
PGID=${PGID:-1000}
TZ=${TZ:-UTC}

echo "Starting Rsync Container..."
echo "User UID: $PUID"
echo "User GID: $PGID"
echo "Timezone: $TZ"

# 2. Set Timezone
ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# 3. Set User and Group IDs
groupmod -o -g "$PGID" appgroup
usermod -o -u "$PUID" appuser

# 4. Fix permissions for the log/run directory if they exist (Optional safety)
mkdir -p /var/run/rsyncd
chown -R appuser:appgroup /var/run/rsyncd

# 5. Execute the command (rsync)
exec "$@"
