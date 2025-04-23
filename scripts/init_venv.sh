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

echo "==== Initializing Virtual Environment ===="

cd /home/ec2-user/django-react-starter || exit 1

# Ensure Python 3 is available
if ! command -v python3 &> /dev/null; then
  echo "Python3 not found. Installing..."
  sudo yum install -y python3
fi

# Create virtual environment if not already present
if [ ! -d "venv" ]; then
  python3 -m venv venv || { echo "Virtualenv creation failed"; exit 1; }
fi

# Activate the virtual environment
source venv/bin/activate || { echo "Virtualenv activation failed"; exit 1; }

# Upgrade pip and install dependencies
pip install --upgrade pip
pip install -r backend/requirements.txt || { echo "Failed to install Python dependencies"; exit 1; }

echo "==== Virtual Environment Setup Complete ===="
