#!/bin/bash

set -e # settting the automatic exit, if we get error
failure {
    echo "failed at : $!:$2
}


trap 'failure "$ {LINENO}" "$BASH_COMMAND"' ERR #error signal
echo "Hello world success"
echo "Hello world failure"
echo "Hello worls after failure"