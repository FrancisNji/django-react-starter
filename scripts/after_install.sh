#!/bin/bash
set -e
echo "---- [AfterInstall] Running migrations and building frontend ----"

cd /home/ec2-user/django-react-starter/backend
source venv/bin/activate
python manage.py makemigrations
python manage.py migrate

cd ../frontend
npm run build

echo "Copying frontend build to Django static directory"
cp -r dist ../backend/frontend/dist
