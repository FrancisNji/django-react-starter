#!/bin/bash

# Start backend (consider using a process manager like gunicorn or supervisord)
cd /home/ec2-user/django-react-starter/backend
source venv/bin/activate
nohup python manage.py runserver 0.0.0.0:8000 &

# Start frontend dev server (for dev environments)
cd ../frontend
nohup npm run dev &
