#!/bin/sh
set -e

# Render config file
sed -i "s|LOGSTASH_HOST|${LOGSTASH_HOST}|g" /filebeat/filebeat.yml

exec "$@"
