#!/bin/bash

set -e

# allow easier debugging with `docker run -e VERBOSE=yes`
if [[ "$VERBOSE" = "yes" ]]; then
  set -x
fi

# allow easier reset core with `docker run -e RESET_CORE=true`
if [[ "$RESET_CORE" = "true" ]]; then
  echo "Removing core /var/solr/data/$CONFIGSET"
  rm -rf /var/solr/data/$CONFIGSET
fi

if [ ! -f "/var/solr/data/$CONFIGSET/core.properties" ]; then
  start-local-solr
  solr create -c $CONFIGSET -d "/opt/solr/server/solr/configsets/$CONFIGSET" -p 8983
  stop-local-solr
else
  echo "$CONFIGSET collection already exists";
fi

exec solr -f
