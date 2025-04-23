#!/bin/bash

echo "---- [ApplicationStart] Starting Django and React Dev Servers ----"

cd /home/ec2-user/django-react-starter/backend

if [ ! -f "venv/bin/activate" ]; then
  echo "❌ Virtual environment not found at $(pwd)/venv"
  echo "Contents of backend:"
  ls -la
  exit 1
fi

source venv/bin/activate

# Kill any existing server
pkill -f "manage.py runserver" || true

# Run server
nohup python manage.py runserver 0.0.0.0:8000 > ../output.txt 2>&1 &

echo "✅ Django server started."
