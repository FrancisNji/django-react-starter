#!/bin/bash

set -e

# Permissions
sudo chmod -R 777 /home/ec2-user/django-react-starter

# Navigate to project
cd /home/ec2-user/django-react-starter

# Update system and install packages
sudo yum update -y
sudo yum install -y gcc gcc-c++ make \
  python3-devel \
  libjpeg-devel \
  zlib-devel \
  git

# OPTIONAL: Manually install HDF5 if needed
# Skipping hdf5-devel since not available on Amazon Linux 2

# Create and activate virtualenv
bash init_venv.sh

# Backend setup
cd backend
source ../venv/bin/activate
python manage.py makemigrations
python manage.py migrate

# Frontend setup
cd ../frontend
npm install --legacy-peer-deps
