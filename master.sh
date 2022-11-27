#!/bin/bash
sudo docker swarm init --advertise-addr=172.23.0.100
sudo docker swarm join-token worker | grep docker > worker.sh