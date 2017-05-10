#!/bin/sh
adapter whip/adapter_client.yaml &
sleep 1
shim python src/client.py discovery 8000
