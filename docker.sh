#!/usr/bin/env bash

#!/bin/bash
#Open Docker, only if is not running

process=$(ps -ef | grep "[d]ockerd")

if [ -z "$process" ]
then
    echo "Starting docker"
    sudo systemctl start docker
fi


while [ -z "$process" ]
do
    echo "waiting for docker to launch"
    sleep 1
    process=$(ps -ef | grep "[d]ockerd")
done

# Execute docker commands
docker $@
