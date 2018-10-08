#!/bin/sh
adapter whip/adapter_client.yaml &
sleep 10
python src/client.py discovery 8000
