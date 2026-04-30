#!/bin/sh
set -e

PORT="${PORT:-8080}"

# Patch Rammerhead config to bind 0.0.0.0 on the platform-provided port.
if [ -f config.js ]; then
  sed -i "s/bindingAddress:[[:space:]]*'[^']*'/bindingAddress: '0.0.0.0'/" config.js
  sed -i "s/port:[[:space:]]*[0-9]\+/port: ${PORT}/" config.js
fi

exec node src/server.js
