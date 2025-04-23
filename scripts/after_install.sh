#!/bin/bash
set -e
echo "---- [AfterInstall] Running migrations and building frontend ----"

BACKEND_DIR="/home/ec2-user/django-react-starter/backend"
cd "$BACKEND_DIR"

# Log current working directory and files
echo "Working dir: $(pwd)"
ls -la

# Check and create virtualenv
if [ ! -d "venv" ]; then
    echo "Creating virtual environment..."
    python3 -m venv venv
fi

# Activate it
source venv/bin/activate

# Install dependencies
pip install --upgrade pip
pip install -r requirements.txt

python manage.py makemigrations
python manage.py migrate

cd ../frontend
npm run build

echo "Copying frontend build to Django static directory"
cp -r dist ../backend/frontend/dist

