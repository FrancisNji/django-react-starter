#!/bin/bash
set -e
echo "---- [Install] Creating virtual environment and installing dependencies ----"

cd /home/ec2-user/django-react-starter/backend

python3 -m venv venv
source venv/bin/activate
pip install --upgrade pip
pip install -r requirements.txt

cd ../frontend
npm install --legacy-peer-deps
