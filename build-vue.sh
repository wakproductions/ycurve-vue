#!/usr/bin/env bash
cd ./ycurve-frontend
yarn run build
mv -rf dist/* ../ycurve-backend/public
cd ../