#!/bin/sh
cd $(dirname $0)

adapter adapter.yaml &
sleep 1
shim python discovery.py 7999
