#!/usr/bin/env bash
# Wrapper for `docker-compose` with correct configs loaded

# get current script dir
# http://stackoverflow.com/a/246128/846432
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

APP_ENV=prod
source "${DIR}/includes/docker-compose.sh"
