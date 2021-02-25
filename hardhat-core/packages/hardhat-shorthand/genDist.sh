#!/bin/sh
npm install
./node_modules/.bin/ncc build src/index.ts -o bin
