#!/bin/bash
cd "$(dirname "$0")"
export YOLO_CONFIG_DIR="$PWD/.yolo"
if [ ! -x ".venv/bin/python" ]; then
    python3 -m venv .venv || { echo "Could not create venv"; read -n1; exit 1; }
fi
if [ ! -f ".venv/setup.done" ]; then
    .venv/bin/python -m pip install -r requirements.txt || { echo "Install failed"; read -n1; exit 1; }
    touch .venv/setup.done
fi
.venv/bin/python app.py "$@" || { echo; echo "Focus Desk could not start. See the error above."; read -n1; exit 1; }
