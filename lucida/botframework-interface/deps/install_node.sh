#!/bin/bash

apt-get install -y npm && npm config set strict-ssl false && npm install -g n && sudo n lts
