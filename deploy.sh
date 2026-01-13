#!/bin/bash

# Load envs
if [ -f .env ]; then
  export $(cat .env | xargs)
fi

# Check for password
if [ -z "$ADMIN_PASSWORD" ]; then
  echo "Error: ADMIN_PASSWORD is not set in .env"
  exit 1
fi

echo "🚀 Deploying Edge Tunnel..."

# Pull latest code
git pull origin main

# Cleanup potential conflicts
docker stop wg-easy edge-tunnel wireguard 2>/dev/null || true
docker rm wg-easy edge-tunnel wireguard 2>/dev/null || true

# Build and start
docker compose -f compose.prod.yaml up -d --build

# Prune old images
docker image prune -f

echo "✅ Deployment complete. access at https://edge.xoxoent.space"
