#!/usr/bin/env bash

# get current script dir
# http://stackoverflow.com/a/246128/846432
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
APP_DIR=${DIR}/..

set -eux
SERVER=benderis
REMOTE_PATH=/home/deploy/dev/mercure
ssh ${SERVER} mkdir -p ${REMOTE_PATH}

echo Copying files...
rsync -az \
    ${APP_DIR}/.env.prod \
    ${APP_DIR}/.gitignore \
    ${APP_DIR}/docker-compose.prod.yaml \
    ${APP_DIR}/docker-compose.yaml \
    ${APP_DIR}/README.md \
    ${SERVER}:${REMOTE_PATH}
ssh ${SERVER} mkdir -p ${REMOTE_PATH}/bin
rsync -az ${APP_DIR}/bin/start-prod.sh ${SERVER}:${REMOTE_PATH}/bin/
echo Done.

echo Starting...
ssh ${SERVER} "cd ${REMOTE_PATH} ; bin/start-prod.sh -d"
echo Done.

echo All done, great success!
