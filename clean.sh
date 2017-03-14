#!/usr/bin/env bash

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

flyway -configFile=${DIR}/flyway.apps.conf -locations=filesystem:${DIR}/db/apps clean
rc=$?; if [[ $rc != 0 ]]; then exit $rc; fi

flyway -configFile=${DIR}/flyway.apps_ui.conf -locations=filesystem:${DIR}/db/apps_ui clean
rc=$?; if [[ $rc != 0 ]]; then exit $rc; fi

flyway -configFile=${DIR}/flyway.apps_api.conf -locations=filesystem:${DIR}/db/apps_api clean
rc=$?; if [[ $rc != 0 ]]; then exit $rc; fi

flyway -configFile=${DIR}/flyway.apps_data.conf -locations=filesystem:${DIR}/db/apps_data clean
rc=$?; if [[ $rc != 0 ]]; then exit $rc; fi
