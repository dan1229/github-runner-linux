#!/bin/bash

GIT_USER=$GIT_USER
REPO_NAME=$REPO_NAME
REG_TOKEN=$REG_TOKEN

# REG_TOKEN=$(curl -sX POST -H "Authorization: token ${ACCESS_TOKEN}" https://api.github.com/orgs/${ORGANIZATION}/actions/runners/registration-token | jq .token --raw-output)

cd /home/docker/$REPO_NAME

./config.sh --url https://github.com/${GIT_USER}/${REPO_NAME} --token ${REG_TOKEN}
# ./config.sh --url https://github.com/dan1229/github-runner-linux --token AB4KFU342QR2PZ24WX6YJVDBZPSX4

cleanup() {
    echo "Removing runner..."
    ./config.sh remove --unattended --token ${REG_TOKEN}
}

trap 'cleanup; exit 130' INT
trap 'cleanup; exit 143' TERM

./run.sh & wait $!

