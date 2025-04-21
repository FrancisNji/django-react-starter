#!/bin/bash
echo "---- [ApplicationStop] Stopping running servers ----"
pkill -f runserver || true
pkill -f "npm run dev" || true