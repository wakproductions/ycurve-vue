#!/usr/bin/env bash
cd ./ycurve-frontend
yarn run build
rm -r ../ycurve-backend/public/js
rm -r ../ycurve-backend/public/css
rm -r ../ycurve-backend/public/index.html
mv dist/* ../ycurve-backend/public
cd ../