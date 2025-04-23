#!/bin/bash

# Stop Django server
pkill -f "manage.py runserver"
tmux kill-session -t django 2>/dev/null || true
