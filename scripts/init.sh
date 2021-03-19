#!/bin/sh
wget https://github.com/nomiclabs/hardhat/archive/hardhat-core-v2.0.11.tar.gz
tar xvzf hardhat-core-v2.0.11.tar.gz
mv hardhat-hardhat-core-v2.0.11/ hardhat-core
cd hardhat-core
npm install 
./node_modules/.bin/tsc --build packages/hardhat-shorthand
ls -l packages/hardhat-shorthand/
cd hardhat-core/packages/hardhat-shorthand/
