#! /bin/bash

ssh ubuntu@192.168.64.17 << EOF
  cd /home/server/jenkis2

  git pull origin main
EOF