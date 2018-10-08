#!/bin/sh
adapter whip/adapter_adder.yaml &
sleep 15
shim python src/adder.py adder 8001 discovery 8000
