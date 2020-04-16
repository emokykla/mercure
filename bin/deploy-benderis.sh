#!/usr/bin/env bash
# get current script dir
# http://stackoverflow.com/a/246128/846432
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

APP_ENV=benderis
APP_SERVER=benderis
source "${DIR}/includes/deploy.sh"
