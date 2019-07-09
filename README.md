# Running Locally for Development

1. Run the back end with `docker-compose up backend`
2. Run the front end by running `docker-compose -f docker-compose.yml -f docker-compose.development.yml up frontend`

# Running in a Production Environment

`docker-compose -f docker-compose.yml -f docker-compose.production.yml up`

## Running this app anywhere

```
docker-compose up web
```

## Production Server File Locations

`/var/www/ustreasuryyieldcurve-com`

## Deploy

`./deploy-production.sh`
