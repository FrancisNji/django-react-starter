#!/bin/bash
set -e
echo "---- [ApplicationStart] Starting Django and React Dev Servers ----"

cd /home/ec2-user/django-react-starter/backend
source venv/bin/activate
nohup python manage.py runserver 0.0.0.0:8000 &

cd ../frontend
nohup npm run dev &
