#!/bin/sh

DISPLAY=host.docker.internal:0 open -a XQuartz && xhost + ${hostname}

docker-compose up

open -a XQuartz && xhost - && exit
