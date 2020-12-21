# Caddy

## Reload configuration after change

### Json
```shell
# make sure config is changed
bin/dc-prod.sh exec mercure cat /etc/caddy/Caddy.json
# validate
bin/dc-prod.sh exec mercure caddy validate --config /etc/caddy/Caddy.json
# reload
bin/dc-prod.sh exec mercure caddy reload --config /etc/caddy/Caddy.json
```

### Caddyfile
```shell
# make sure config is changed
bin/dc-prod.sh exec mercure cat /etc/caddy/Caddyfile
# validate
bin/dc-prod.sh exec mercure caddy validate --config /etc/caddy/Caddyfile --adapter caddyfile
# reload
bin/dc-prod.sh exec mercure caddy reload --config /etc/caddy/Caddyfile --adapter caddyfile
```

# Prerequisites to run it in prod
- docker
- docker-compose
- Since this does not use SSL - CloudFlare SSl settings must be set to "Flexible". It it possible to configure let's encrypt but that most likely would clash 
    with CloudFlare.

# Prod stages: prod
Main mercure service for prod uses. Deployed to separate vm with hostname `mercure`.
[https://mercure.eturinys.lt](https://mercure.eturinys.lt)

## Deploy
Just run script. It will copy files (local changes are copied, not commited ones!) and restarts services.
```bash
bin/deploy-prod.sh
```

## Run docker-compose
To run docker-compose commands use `bin/dc-prod.sh` instead of `docker-compose`. E.g.
```bash
bin/dc-prod.sh up mercure
```
There is shortcut command for starting:
```bash
bin/start-prod.sh
```

# Prod stages: benderis
Mercure service for use with dev tools. Deployed to `benderis` and used behind Traefik.
[https://mercure.emokykla.win](https://mercure.emokykla.win)

## Deploy
Just run script. It will copy files (local changes are copied, not commited ones!) and restarts services.
```bash
bin/deploy-benderis.sh
```

## Run docker-compose
To run docker-compose commands use `bin/dc-benderis.sh` instead of `docker-compose`. E.g.
```bash
bin/dc-benderis.sh up mercure
```
There is shortcut command for starting:
```bash
bin/start-benderis.sh
```

# Dev

## Run docker-compose
Use docker-compose as you would normally. E.g.
```
docker-compose up mercure
```

## Accessing
Container is not exposed by default so would need to use container IP to access it's default port 80. To access it differently there are other options available
 in `docker-compose.override.yaml.dist` (copy it to `docker-compose.override.yaml` and adjust):
1. Use together with Traefik and domain name:
    - uncomment section in `docker-compose.override.yaml`
    - adjust domain name (default:  `dev-mercure.emokykla.win`)
2. Expose port and access on directly on localhost
    - uncomment section in `docker-compose.override.yaml`
    - adjust local port (default: `1580`)
    - Access demo page `http://localhost:1580`.

