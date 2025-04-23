#!/bin/bash

echo "==== [AfterInstall] Running setup for Django and React ===="

# Fix permissions to avoid permission denied errors
sudo chmod -R 777 /home/ec2-user/django-react-starter

# Activate Python venv and install Python dependencies
cd /home/ec2-user/django-react-starter
bash init_venv.sh

# Run Django migrations
cd /home/ec2-user/django-react-starter/backend
source venv/bin/activate
python manage.py makemigrations
python manage.py migrate

# Install frontend dependencies
cd /home/ec2-user/django-react-starter/frontend
npm install --legacy-peer-deps
npm run dev

# Build the frontend
npm run build

echo "✅ AfterInstall completed."
