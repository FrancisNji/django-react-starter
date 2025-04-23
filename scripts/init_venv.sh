# #!/bin/bash

# cd /home/ec2-user/django-react-starter/backend

# # Setup virtual environment
# python3 -m venv venv
# source venv/bin/activate

# pip install --upgrade pip
# pip install -r requirements.txt

# # Django migrations
# python manage.py makemigrations
# python manage.py migrate

# # Frontend install
# cd ../frontend
# npm install --legacy-peer-deps

# # Build frontend
# npm run build

# # Copy frontend build to Django
# cp -r dist ../backend/frontend/dist


#!/bin/bash

#!/bin/bash

set -e  # Exit immediately if a command exits with a non-zero status

echo "==== [AfterInstall] Django migrations & React build ===="

cd /home/ec2-user/django-react-starter || exit 1

# SYSTEM DEPENDENCIES FIRST
echo "==== Installing system-level dependencies for Python builds ===="
sudo yum -y update
sudo yum -y groupinstall "Development Tools"
sudo yum -y install gcc gcc-c++ python3-devel hdf5 hdf5-devel

# ACTIVATE VENV
echo "==== Activating virtualenv ===="
source venv/bin/activate || { echo "Failed to activate venv"; exit 1; }

# BACKEND SETUP
echo "==== Installing backend Python dependencies ===="
cd backend || exit 1
pip install --upgrade pip setuptools wheel
pip install -r requirements.txt || { echo "Failed to install Python requirements"; exit 1; }

# FRONTEND SETUP
echo "==== Installing frontend dependencies and building React ===="
cd ../frontend || exit 1

if ! command -v npm &> /dev/null; then
  echo "npm not found, installing Node.js..."
  curl -fsSL https://rpm.nodesource.com/setup_18.x | sudo bash -
  sudo yum install -y nodejs
fi

npm install --legacy-peer-deps || { echo "npm install failed"; exit 1; }
npm run build || { echo "npm run build failed"; exit 1; }

echo "==== [AfterInstall] Script completed successfully ===="


