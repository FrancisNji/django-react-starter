#!/bin/bash

echo "==== [AfterInstall] Django migrations & React build ===="

# Navigate to project root
cd /home/ec2-user/django-react-starter || exit 1

# Create virtualenv if it doesn't exist
if [ ! -d "venv" ]; then
  echo "Creating Python virtual environment..."
  python3 -m venv venv || { echo "Failed to create virtualenv"; exit 1; }
fi

# Activate virtualenv
source venv/bin/activate || { echo "Failed to activate virtualenv"; exit 1; }

# Upgrade pip & install requirements
pip install --upgrade pip
pip install -r backend/requirements.txt || { echo "Failed to install backend dependencies"; exit 1; }

# Apply migrations
cd backend || exit 1
python3 manage.py makemigrations || exit 1
python3 manage.py migrate || exit 1

# Frontend setup
cd ../frontend || exit 1

# Install Node.js if npm is missing (optional)
if ! command -v npm &> /dev/null; then
  echo "Installing Node.js and npm..."
  curl -fsSL https://rpm.nodesource.com/setup_18.x | sudo bash -
  sudo yum install -y nodejs
fi

npm install --legacy-peer-deps || { echo "npm install failed"; exit 1; }
npm run build || { echo "npm build failed"; exit 1; }

echo "==== AfterInstall completed successfully ===="
