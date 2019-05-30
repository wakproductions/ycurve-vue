#!/usr/bin/env bash
cd ./frontend
yarn run build
rm -r ../backend/public/js
rm -r ../backend/public/css
rm -r ../backend/public/index.html
mv dist/* ../backend/public
cd ../