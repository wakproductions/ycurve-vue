# Running Locally for Development

1. Run the back end with `docker-compose up web database`
2. Run the front end by going into the `ycurve-frontend` folder and running `yarn serve`

# Compiling for Production (Local Step)

## Build front end for production

This application is to be deployed and run from the `ycurve-backend` folder. The front end files for production are
to be built from the script `build-vue.sh`, which when run will build the front end and put it in the 
`./ycurve-backend/public` folder, to be served as a static SPA.

## Running this app anywhere

```
docker-compose up web
```

## Production Server File Locations

`/var/www/ustreasuryyieldcurve-com`

