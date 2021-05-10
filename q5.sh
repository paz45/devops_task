#!/bin/bash
set -eux

declare -r HOST="0.0.0.0:5000"

wait-for-url() {
    echo "Testing $1"
    timeout -s TERM 10 bash -c \
    'while [[ "$(curl -s -o /dev/null -L -w ''%{http_code}'' ${0})" != "200" ]];\
    do echo "Waiting for ${0}" && sleep 2;\
    done' ${1}
    echo "OK"
}
wait-for-url ${HOST}