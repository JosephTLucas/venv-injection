#!/bin/bash

python3 -m venv dest_env
source dest_env/bin/activate
pip install pandas

echo "[+] Created a clean venv with a simple pip install"
deactivate