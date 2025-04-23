#!/bin/bash

echo "==== [Install] Setting up Python environment ===="

cd /home/ec2-user/django-react-starter/backend || {
  echo "❌ Failed to cd into backend"; exit 1;
}

# Create virtualenv if it doesn't exist
if [ ! -d "venv" ]; then
  python3 -m venv venv || {
    echo "❌ Failed to create virtual environment"; exit 1;
  }
fi

# Activate venv
source venv/bin/activate

# Install requirements
pip install --upgrade pip
pip install -r requirements.txt || {
  echo "❌ Failed to install requirements"; exit 1;
}

echo "✅ venv created and requirements installed"
