if [ -z "${DB_TYPE}" ]; then
  echo Input DB_TYPE is missing
  exit 1
fi

if [ -z "${APP_GIT_URL}" ]; then
  echo Input APP_GIT_URL is missing
  exit 1
fi

if [ -z "${DB_HOST}" ]; then
  echo Input DB_HOST is missing
  exit 1
fi

if [ -z "${SCHEMA_FILE}" ]; then
  echo Input SCHEMA_FILE is missing
  exit 1
fi

if [ "${DB_TYPE}" == "mysql" ]; then
  if [ -z "${DB_USER}" ]; then
    echo Input DB_USER is missing
    exit 1
  fi

  if [ -z "${DB_PASS}" ]; then
    echo Input DB_PASS is missing
    exit 1
  fi

fi

if [ "${DB_TYPE}" == "mongo" ]; then
  git clone ${APP_GIT_URL} .
  mongosh --host ${DB_HOST} <${SCHEMA_FILE}
elif [ "${DB_TYPE}" == "mysql" ]; then
  git clone ${APP_GIT_URL} .
  mysql -h $DB_HOST -u$DB_USER -p$DB_PASS <${SCHEMA_FILE}
fi









