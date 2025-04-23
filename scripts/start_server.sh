#!/bin/bash

echo "---- [ApplicationStart] Starting Django and React Dev Servers ----"

cd /home/ec2-user/django-react-starter/backend

# Activate virtual environment
source venv/bin/activate

# Run Django dev server in background
nohup python manage.py runserver 0.0.0.0:8000 &

# (Optional) Start React dev server too
cd ../frontend
nohup npm run dev &

echo "---- [ApplicationStart] Servers started ----"

