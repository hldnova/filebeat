#!/bin/sh
set -e

# convert comma separated list of hosts to comma separate list with double quotes on each
# for example, 1.1.1.1,2.2.2.2 to "1.1.1.1", "2.2.2.2"
LOGSTASH_HOSTS=`echo $LOGSTASH_HOSTS | sed -e 's/ //g' | sed -e 's/^\|$/"/g' | sed -e 's/,/", "/g'`
ELASTICSEARCH_HOSTS=`echo $ELASTICSEARCH_HOSTS | sed -e 's/ //g' | sed -e 's/^\|$/"/g' | sed -e 's/,/", "/g'`

# Render config file
cat filebeat.yml | sed "s|LOGSTASH_HOSTS|${LOGSTASH_HOSTS}|g" | sed "s|ELASTICSEARCH_HOSTS|${ELASTICSEARCH_HOSTS}|g" > filebeat-out.yml

exec "$@"
