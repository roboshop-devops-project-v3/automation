if [ -z "${CATALOGUE_HOST}" ]; then
  echo Input CATALOGUE_HOST is missing
  exit 1
fi

if [ -z "${CATALOGUE_PORT}" ]; then
  echo Input CATALOGUE_PORT is missing
  exit 1
fi

if [ -z "${REDIS_HOST}" ]; then
  echo Input REDIS_HOST is missing
  exit 1
fi

node server.js
