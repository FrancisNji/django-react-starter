#!/bin/bash
set -e
echo "---- [Install] Creating virtual environment and installing dependencies ----"

BACKEND_DIR="/home/ec2-user/django-react-starter/backend"
cd "$BACKEND_DIR"

# Create virtual environment only if it doesn't exist
if [ ! -d "venv" ]; then
  python3 -m venv venv
fi

source venv/bin/activate
pip install --upgrade pip
pip install -r requirements.txt

cd ../frontend
npm install --legacy-peer-deps

