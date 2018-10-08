#!/bin/sh
adapter whip/adapter_discovery.yaml &
sleep 5
shim python src/discovery.py 7999
