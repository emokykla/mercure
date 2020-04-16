#!/usr/bin/env bash
# Wrapper for `docker-compose` with correct configs loaded

if [[ -z "${APP_ENV}" ]]; then
    echo -e "\e[31mAPP_ENV is not defined, exiting.\e[0m"
    exit 1
fi

# get current script dir
# http://stackoverflow.com/a/246128/846432
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
APP_DIR=${DIR}/../..

cd ${APP_DIR}
set -eux
APP_ENV=${APP_ENV} docker-compose --env-file=.env.${APP_ENV} -f docker-compose.yaml -f docker-compose.${APP_ENV}.yaml "$@"
