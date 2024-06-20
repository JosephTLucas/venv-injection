#!/bin/bash

python3 -m venv source_env
source source_env/bin/activate
./add_code.sh pandas/pandas/io/parsers/readers.py 814 
cd pandas
pip install .

echo "[+] Created a venv with a tampered version of pandas"
deactivate