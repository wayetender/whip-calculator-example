#!/bin/sh
adapter whip/adapter_discovery.yaml &
sleep 1
shim python src/discovery.py 7999
