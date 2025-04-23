#!/bin/bash

echo "==== [ApplicationStart] Starting Django and React Dev Servers ===="

# Start backend
cd /home/ec2-user/django-react-starter/backend || exit 1

if [ ! -f "venv/bin/activate" ]; then
  echo "❌ venv not found"; exit 1
fi

source venv/bin/activate
nohup python manage.py runserver 0.0.0.0:8000 > ../django.out.log 2> ../django.err.log < /dev/null &

# Start frontend
cd ../frontend
nohup npm run dev > ../react.out.log 2> ../react.err.log < /dev/null &

echo "✅ Django and React servers started"
