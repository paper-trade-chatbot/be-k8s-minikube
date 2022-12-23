#!/bin/bash

RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[1;33m"
NC="\033[0m"

printf "${GREEN}Deploy rabbitmq:${NC} get new repo of rabbitmq"
helm repo add bitnami https://charts.bitnami.com/bitnami

if [[ -f "./values.yaml" ]]
then
    # printf "${GREEN}Deploy rabbitmq:${NC} delete old rabbitmq helm...\n"
    # printf "${GREEN}Deploy rabbitmq:${NC} "
    # helm delete rabbitmq
    # printf "${GREEN}Deploy rabbitmq:${NC} apply rabbitmq helm...\n"
    # printf "${GREEN}Deploy rabbitmq:${NC} "
    # helm install rabbitmq bitnami/rabbitmq -f values.yaml --debug
    printf "${GREEN}Deploy rabbitmq:${NC} upgrade rabbitmq helm...\n"
    printf "${GREEN}Deploy rabbitmq:${NC} "
    helm upgrade --install rabbitmq bitnami/rabbitmq --debug -f values.yaml
else
    printf "${RED}Error:${NC}helm yaml doesn't exist.\n"
    exit 0
fi

printf "${GREEN}Deploy rabbitmq:${NC} Complete!\n"