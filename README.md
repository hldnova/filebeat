# filebeat

## Prerequisites

Docker engine and optionally docker-compose

## Quick Start

Clone this repository and cd to filebeat

Build docker image

```
# docker build --rm=true --tag <your_filebeat_image_tag> .
```

Edit filebeat.yml to configure filebeat prospectors and output destination, either logstash or elasticsearch 

Start container from command line. Make sure the volume mapping is consistent with the path in filebeat.yml

```
# docker run -d -v ./filebeat.yml:/filebeat/filebeat.yml -v ./logs:/var/log --name <your_container_name> <your_filebeat_image_tag>
```

Or optionally use docker-compose. Edit the docker-compose.yml to use either your locally built image or pull from docker hub
```
# docker-compose up -d
```
