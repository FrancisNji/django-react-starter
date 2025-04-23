#!/bin/bash

set -e  # Exit script on any error

# Give permissions
sudo chmod -R 777 /home/ec2-user/django-react-starter

# Move into project directory
cd /home/ec2-user/django-react-starter

# Install required system-level dependencies
sudo yum update -y
sudo yum install -y gcc gcc-c++ make \
  hdf5-devel \
  python3-devel \
  libjpeg-devel \
  zlib-devel \
  git

# Initialize virtual environment
bash init_venv.sh

# Activate virtualenv
source venv/bin/activate

# Install Python dependencies (backend)
cd backend
pip install --upgrade pip
pip install -r requirements.txt

# Django database migrations
python manage.py makemigrations
python manage.py migrate

# Frontend setup
cd ../frontend
npm install --legacy-peer-deps

echo "✅ after_install.sh completed successfully"
