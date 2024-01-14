# monerod-docker

This is as simple docker image that allows one to run a monero node in docker

## Quick Start

1. Create the following `docker-compose.yml` file and mofify it if you wish to make modifications:

```yaml
version: "3.8"

services:

  monerod:
    container_name: monerod
    image: elasticrock/monerod:latest
    volumes: 
      - /path/to/dir:/root/.bitmonero
    ports:
    #  - 18080:18080 Uncomment if you wish to seed the blockchain for others
      - 18081:18081
    deploy:
      restart_policy:
        condition: unless-stopped
```
2. Run `docker compose up -d` to download the image and start it
