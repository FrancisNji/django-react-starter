#!/bin/bash

echo "==== [AfterInstall] Running Django backend setup ===="

cd /home/ec2-user/django-react-starter/backend

# Activate virtual environment
source venv/bin/activate

# Run database migrations
python manage.py migrate

# Collect static files
python manage.py collectstatic --noinput

echo "==== [AfterInstall] Building React frontend ===="

cd /home/ec2-user/django-react-starter/frontend

# Ensure Node.js is installed and available
npm install
npm run build

echo "==== [AfterInstall] Deployment steps completed successfully ===="

