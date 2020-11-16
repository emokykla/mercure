#!/usr/bin/env bash
# Wrapper for docker-compose stop and up --detach with correct configs.

if [[ -z "${APP_ENV}" ]]; then
    echo -e "\e[31mAPP_ENV is not defined, exiting.\e[0m"
    exit 1
fi

# get current script dir
# http://stackoverflow.com/a/246128/846432
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
APP_DIR=${DIR}/../..

cd ${APP_DIR}
bin/dc-${APP_ENV}.sh stop --timeout 300 mercure && bin/dc-${APP_ENV}.sh up --detach mercure
