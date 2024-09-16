if [ -z "${CART_ENDPOINT}" ]; then
  echo Input CART_ENDPOINT is missing
  exit 1
fi

if [ -z "${DB_HOST}" ]; then
  echo Input DB_HOST is missing
  exit 1
fi

java -jar shipping.jar


