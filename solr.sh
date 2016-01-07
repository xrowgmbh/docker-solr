#!/bin/bash


if [ -z "$SOLR_PORT" -a -z "$SOLR_SERVICE_PORT_SOLR" ]; then
    SOLR_PORT=$SOLR_SERVICE_PORT_SOLR
fi

EXEC /opt/solr/bin/solr -f