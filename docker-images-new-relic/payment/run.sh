if [ -z "${CART_HOST}" ]; then
  echo Input CART_HOST is missing
  exit 1
fi

if [ -z "${CART_PORT}" ]; then
  echo Input CART_PORT is missing
  exit 1
fi

if [ -z "${USER_HOST}" ]; then
  echo Input USER_HOST is missing
  exit 1
fi

if [ -z "${USER_PORT}" ]; then
  echo Input USER_PORT is missing
  exit 1
fi

if [ -z "${AMQP_HOST}" ]; then
  echo Input AMQP_HOST is missing
  exit 1
fi

if [ -z "${AMQP_USER}" ]; then
  echo Input AMQP_USER is missing
  exit 1
fi

if [ -z "${AMQP_PASS}" ]; then
  echo Input AMQP_PASS is missing
  exit 1
fi

uwsgi --ini payment.ini



