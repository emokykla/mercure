#!/usr/bin/env bash
# Wrapper for docker-compose up wit correct configs.
# any parameter will be passed to docker-compose up command (e.g. "-d")

if [[ -z "${APP_ENV}" ]]; then
    echo -e "\e[31mAPP_ENV is not defined, exiting.\e[0m"
    exit 1
fi

# get current script dir
# http://stackoverflow.com/a/246128/846432
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
APP_DIR=${DIR}/../..

cd ${APP_DIR}
bin/dc-${APP_ENV}.sh up "$@" mercure
