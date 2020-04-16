#!/usr/bin/env bash
# Wrapper for `docker-compose` with correct configs loaded

# get current script dir
# http://stackoverflow.com/a/246128/846432
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
APP_DIR=${DIR}/..

cd ${APP_DIR}
APP_ENV=prod
set -eux
APP_ENV=${APP_ENV} docker-compose --env-file=.env.${APP_ENV} -f docker-compose.yaml -f docker-compose.${APP_ENV}.yaml "$@"
