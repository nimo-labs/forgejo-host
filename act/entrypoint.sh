#!/bin/bash
./act_runner register --instance $PROTOCOL://$FORGEJO_IP:$FORGEJO_PORT --token $TOKEN --labels $LABELS --no-interactive
./act_runner daemon
