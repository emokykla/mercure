#!/usr/bin/env bash

if [[ -z "${APP_ENV}" ]]; then
    echo -e "\e[31mAPP_ENV is not defined, exiting.\e[0m"
    exit 1
fi
if [[ -z "${APP_SERVER}" ]]; then
    echo -e "\e[31mAPP_SERVER is not defined, exiting.\e[0m"
    exit 1
fi


# get current script dir
# http://stackoverflow.com/a/246128/846432
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
APP_DIR=${DIR}/../..

set -eux
REMOTE_PATH=/home/deploy/dev/mercure
ssh ${APP_SERVER} mkdir -p ${REMOTE_PATH}

echo Copying files...
rsync --archive --compress \
    ${APP_DIR}/.gitignore \
    ${APP_DIR}/docker-compose.${APP_ENV}.yaml \
    ${APP_DIR}/docker-compose.yaml \
    ${APP_DIR}/README.md \
    ${APP_SERVER}:${REMOTE_PATH}
ssh ${APP_SERVER} mkdir -p ${REMOTE_PATH}/bin
rsync --archive --compress \
    ${APP_DIR}/bin/includes \
    ${APP_DIR}/bin/start-${APP_ENV}.sh \
    ${APP_DIR}/bin/restart-${APP_ENV}.sh \
    ${APP_DIR}/bin/dc-${APP_ENV}.sh \
    ${APP_SERVER}:${REMOTE_PATH}/bin/
ssh ${APP_SERVER} mkdir -p ${REMOTE_PATH}/caddy
rsync --archive --compress \
    ${APP_DIR}/caddy/Caddyfile.${APP_ENV} \
    ${APP_DIR}/caddy/Caddy.${APP_ENV}.json \
    ${APP_SERVER}:${REMOTE_PATH}/caddy/
echo Done.

echo Now depending on changes restart, rebuild or just reload caddy config.
