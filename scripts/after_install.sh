# #!/bin/bash

# echo "==== [AfterInstall] Django migrations & React build ===="

# cd /home/ec2-user/django-react-starter || exit 1



# # Fix: Install system dependencies including HDF5 and compilers
# echo "==== Installing system dependencies ===="
# sudo yum -y groupinstall "Development Tools"
# sudo yum -y install hdf5 hdf5-devel gcc gcc-c++ python3-devel

# # Activate virtualenv

# python3 -m venv venv
# source venv/bin/activate || { echo "Failed to activate virtualenv"; exit 1; }

# # Upgrade pip and install backend dependencies
# cd backend || exit 1
# pip install --upgrade pip
# pip install -r /home/ec2-user/django-react-starter/backend/requirements.txt || { echo "Failed to install backend dependencies"; exit 1; }

# # Frontend setup
# cd /home/ec2-user/django-react-starter/frontend || exit 1

# # Ensure npm is installed
# if ! command -v npm &> /dev/null; then
#   echo "Installing Node.js and npm..."
#   curl -fsSL https://rpm.nodesource.com/setup_18.x | sudo bash -
#   sudo yum install -y nodejs
# fi

# npm install --legacy-peer-deps || { echo "npm install failed"; exit 1; }
# npm run build || { echo "npm run build failed"; exit 1; }

# echo "==== AfterInstall completed successfully ===="






#!/bin/bash

set -e  # Exit immediately if a command exits with a non-zero status

# Give permission for everything in the project directory
sudo chmod -R 777 /home/ec2-user/django-react-starter

# Navigate into the working directory
cd /home/ec2-user/django-react-starter

# Fix: Install system dependencies including HDF5 and compilers
echo "==== Installing system dependencies ===="
sudo yum -y groupinstall "Development Tools"
# sudo yum -y install hdf5 hdf5-devel gcc gcc-c++ python3-devel

# Activate virtualenv

python3 -m venv venv
source venv/bin/activate || { echo "Failed to activate virtualenv"; exit 1; }

# Update packages and install HDF5 headers
sudo yum update -y
sudo yum install -y gcc gcc-c++ make \
  hdf5-devel \
  python3-devel \
  libjpeg-devel \
  zlib-devel

# Set up Python virtual environment
bash init_venv.sh

# Install backend dependencies
cd backend
source ../venv/bin/activate
pip install --upgrade pip
pip install -r requirements.txt

# Run Django migrations
python manage.py makemigrations
python manage.py migrate

# Install frontend dependencies
cd ../frontend
npm install --legacy-peer-deps

