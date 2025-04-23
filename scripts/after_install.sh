#!/bin/bash

echo "==== [AfterInstall] Running Django backend setup ===="

cd /home/ec2-user/django-react-starter

# Activate virtual environment

python3 -m venv venv
source venv/bin/activate

cd /home/ec2-user/django-react-starter/backend

# Run database migrations

python manage.py makemigrations
python manage.py migrate

# Collect static files
python manage.py collectstatic --noinput

echo "==== [AfterInstall] Building React frontend ===="

cd /home/ec2-user/django-react-starter/frontend

# Ensure Node.js is installed and available
npm install --legacy-peer-deps
npm run build

cd /home/ec2-user/django-react-starter/backend

python manage.py runserver

cd /home/ec2-user/django-react-starter/frontend

npm run dev

echo "==== [AfterInstall] Deployment steps completed successfully ===="

