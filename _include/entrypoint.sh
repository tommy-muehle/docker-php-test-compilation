#!/usr/bin/env bash
echo -e "-------------------"
echo -e "Host: $HOSTNAME"
echo -e "-------------------"
exec "$@"
