#!/usr/bin/env bash
# Wrapper for docker-compose up wit correct configs.
# any parameter will be passed to docker-compose up command (e.g. "-d")

# get current script dir
# http://stackoverflow.com/a/246128/846432
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

APP_ENV=benderis
source "${DIR}/includes/docker-compose-up.sh"
