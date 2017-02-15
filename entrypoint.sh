#!/bin/sh
set -e

# Render config file
cat filebeat.yml.tmp | sed "s|LOGSTASH_HOST|${LOGSTASH_HOST}|g" | sed "s|LOGSTASH_PORT|${LOGSTASH_PORT}|g" > filebeat.yml

exec "$@"
