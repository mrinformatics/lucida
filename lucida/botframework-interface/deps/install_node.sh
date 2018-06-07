#!/bin/bash

npm config set strict-ssl false && apt-get install -y npm && npm install -g n && sudo n lts
