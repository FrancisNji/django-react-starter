#!/bin/bash

echo "==== [ApplicationStart] Starting Django + React App ===="

# Give permission for everything in the deployment directory
sudo chmod -R 755 /home/ec2-user/django-react-starter

# Load NVM so npm/node commands work
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"

# === BACKEND SETUP ===
cd /home/ec2-user/django-react-starter/backend || exit 1

# Activate virtual environment
if [ -f "venv/bin/activate" ]; then
  echo "✅ Activating virtual environment"
  source venv/bin/activate
else
  echo "❌ Virtual environment not found in backend/"
  exit 1
fi

# Run Django migrations
echo "⚙️ Running Django migrations"
python3 manage.py makemigrations
python3 manage.py migrate

# Run backend server in background (tmux OR nohup)
echo "🚀 Starting Django server"
nohup python3 manage.py runserver 0.0.0.0:8000 > ../django.out.log 2> ../django.err.log < /dev/null &

# === FRONTEND SETUP ===
cd /home/ec2-user/django-react-starter/frontend || exit 1

# Install frontend dependencies
echo "📦 Installing frontend dependencies"
npm install --legacy-peer-deps || {
  echo "❌ npm install failed"; exit 1;
}

# Build frontend app
echo "🛠️ Building React frontend"
npm run build || {
  echo "❌ React build failed"; exit 1;
}

# Copy build output to Django static directory
echo "📁 Copying frontend/dist to backend/frontend/dist"
rm -rf /home/ec2-user/django-react-starter/backend/frontend/dist
cp -r dist /home/ec2-user/django-react-starter/backend/frontend/

# Optionally run frontend dev server (comment out in production)
echo "🚀 Starting React dev server"
nohup npm run dev > ../react.out.log 2> ../react.err.log < /dev/null &

echo "✅ ApplicationStart complete"
