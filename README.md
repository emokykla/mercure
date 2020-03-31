# Setup for dev
- copy `docker-compose.override.yaml.dist` to `docker-compose.override.yaml`. Adjust settings.
- start
```bash
docker-compose up
```
- Access demo page `http://localhost:PORT`. PORT is 80 by default or configured in docker-compose.override.yaml.

# Start for prod
```
./bin/start-prod.sh
# any parameter will be passed to docker-compose up command (e.g. "-d")
./bin/start-prod.sh -d
```
