#!/bin/sh

## Utilities  ##
apt-get update
apt-get install -y git-core curl build-essential openssl libssl-dev gcc make g++ libkrb5-dev

## Node and npm ##
curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash -
sudo apt-get install -y nodejs

## nodemon ##
npm i -g nodemon
npm i -g grunt-cli

## Install app packages ##
cd /vagrant
rm -r node_modules
rm npm-debug.log
npm install --no-bin-links
