#!/bin/bash

echo "==== [Install] Creating and setting up Python virtual environment ===="

cd /home/ec2-user/django-react-starter/backend || exit 1

# Create virtual environment
python3 -m venv venv || { echo "❌ Failed to create venv"; exit 1; }

# Activate it
source venv/bin/activate

# Install dependencies
pip install --upgrade pip
pip install -r requirements.txt || { echo "❌ Failed to install requirements"; exit 1; }

echo "✅ Python virtual environment and packages installed successfully."

