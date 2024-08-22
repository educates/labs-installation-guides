#!/bin/bash

SERVE_DIR="$HOME/exercises"

cd "$SERVE_DIR" || { echo "Directory $SERVE_DIR does not exist."; exit 1; }

python3 -m http.server 11111 --bind 0.0.0.0
