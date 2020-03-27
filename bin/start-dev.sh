#!/usr/bin/env bash
# any parameter will be passed to docker-compose up command (e.g. "-d")

# get current script dir
# http://stackoverflow.com/a/246128/846432
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
APP_DIR=${DIR}/..

set -eux
cd ${APP_DIR}
APP_ENV=dev docker-compose --env-file=.env.dev -f docker-compose.yaml up "$@" mercure
