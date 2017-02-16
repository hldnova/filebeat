#!/bin/sh
set -e

# Render config file
cat filebeat.yml | sed "s|LOGSTASH_HOSTS|${LOGSTASH_HOSTS}|g" | sed "s|ELASTICSEARCH_HOSTS|${ELASTICSEARCH_HOSTS}|g" > filebeat-out.yml

exec "$@"
