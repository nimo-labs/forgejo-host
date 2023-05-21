#!/bin/bash
./act_runner register --instance http://$SERVER_ADDR --token $TOKEN --labels $LABELS --no-interactive
./act_runner daemon
