#!/bin/bash
./act_runner-${ACT_RUNNER_VERSION}-linux-amd64 register --instance $PROTOCOL://$FORGEJO_IP:$FORGEJO_PORT --token $TOKEN --labels $LABELS --no-interactive
./act_runner-${ACT_RUNNER_VERSION}-linux-amd64 daemon
echo DAEMON EXITED