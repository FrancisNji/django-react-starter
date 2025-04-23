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

echo "==== Initializing Virtual Environment and Installing Dependencies ===="

cd /home/ec2-user/django-react-starter || exit 1

# Ensure Python 3 is available
if ! command -v python3 &> /dev/null; then
  echo "Installing Python3..."
  sudo yum install -y python3
fi

# Create and activate virtual environment
if [ ! -d "venv" ]; then
  python3 -m venv venv || { echo "Virtualenv creation failed"; exit 1; }
fi

source venv/bin/activate || { echo "Failed to activate virtualenv"; exit 1; }

# Install system dependencies (HDF5 and compiler)
echo "Installing system packages for Python libraries..."
sudo yum -y install gcc gcc-c++ kernel-devel
sudo yum -y install hdf5 hdf5-devel

# Upgrade pip & install dependencies
pip install --upgrade pip
pip install -r backend/requirements.txt || { echo "Failed to install Python dependencies"; exit 1; }

echo "==== Virtual Environment Setup Complete ===="

