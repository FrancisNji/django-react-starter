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

cd /home/ec2-user/django-react-starter/backend

# Create venv if not present
if [ ! -d "venv" ]; then
  python3 -m venv venv
fi

source venv/bin/activate
pip install --upgrade pip
pip install -r requirements.txt