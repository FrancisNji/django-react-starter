#!/bin/bash
set -e
echo "---- [AfterInstall] Running migrations and building frontend ----"

BACKEND_DIR="/home/ec2-user/django-react-starter/backend"
cd "$BACKEND_DIR"

# Log current working directory and files
echo "Working dir: $(pwd)"
ls -la

# Activate virtual environment
if [ -f "venv/bin/activate" ]; then
  source venv/bin/activate
else
  echo "ERROR: venv/bin/activate not found. Exiting."
  exit 1
fi

python manage.py makemigrations
python manage.py migrate

cd ../frontend
npm run build

echo "Copying frontend build to Django static directory"
cp -r dist ../backend/frontend/dist

