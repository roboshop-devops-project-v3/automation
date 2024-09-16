if [ -z "${MONGO}" ]; then
  echo Input MONGO is missing
  exit 1
fi

if [ -z "${MONGO_URL}" ]; then
  echo Input MONGO_URL is missing
  exit 1
fi

if [ -z "${REDIS_URL}" ]; then
  echo Input REDIS_URL is missing
  exit 1
fi

node server.js
