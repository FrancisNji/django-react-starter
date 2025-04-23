#!/bin/bash

echo "==== [AfterInstall] Django migrations & React build ===="

cd /home/ec2-user/django-react-starter/backend
source venv/bin/activate

python manage.py makemigrations
python manage.py migrate

echo "==== Installing frontend dependencies ===="
cd /home/ec2-user/django-react-starter/frontend
npm install --legacy-peer-deps
npm run dev

# # Move built frontend to Django static
# echo "==== Moving React dist to Django ===="
# rm -rf /home/ec2-user/django-react-starter/backend/frontend/dist
# cp -r /home/ec2-user/django-react-starter/frontend/dist /home/ec2-user/django-react-starter/backend/frontend/dist
