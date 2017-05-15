#!/bin/sh
adapter whip/adapter_client.yaml &
sleep 6
shim python src/client.py discovery 8000
