#!/bin/bash

echo "==== [Install] Creating Python venv ===="

cd /home/ec2-user/django-react-starter/backend || {
  echo "❌ Could not cd into backend"; exit 1;
}

# Ensure permissions are correct
sudo chown -R ec2-user:ec2-user .

# Create virtualenv if not exists
if [ ! -d "venv" ]; then
  python3 -m venv venv || {
    echo "❌ Failed to create virtualenv"; exit 1;
  }
fi

source venv/bin/activate
pip install --upgrade pip
pip install -r requirements.txt || {
  echo "❌ Failed to install Python dependencies"; exit 1;
}

echo "✅ venv and dependencies ready"
