#!/bin/bash
# Test script for AI Chat deployment

set -e

BRAND_NAME=$(grep BRAND_NAME .env | cut -d '=' -f2)
echo "🧪 Testing $BRAND_NAME Chat deployment..."

# Check if services are running
echo -n "✓ Checking services... "
if docker compose ps | grep -q "Up"; then
    echo "OK"
else
    echo "FAIL - Services not running"
    exit 1
fi

# Test branding
echo -n "✓ Testing branding... "
RESPONSE=$(curl -s http://localhost:3081)
if echo "$RESPONSE" | grep -q "$BRAND_NAME"; then
    echo "OK"
else
    echo "FAIL - Branding not applied"
    exit 1
fi

# Test API health
echo -n "✓ Testing API health... "
if curl -s http://localhost:3081/api/health | grep -q "ok"; then
    echo "OK"
else
    echo "FAIL - API not healthy"
fi

# Test custom tools
echo -n "✓ Testing custom tools... "
if docker exec ${BRAND_NAME}-chat ls /app/tools 2>/dev/null | grep -q "financial"; then
    echo "OK"
else
    echo "WARNING - No custom tools found"
fi

# Load demo credentials (if set)
DEMO_EMAIL=$(grep DEMO_EMAIL .env | cut -d '=' -f2 || echo "")
DEMO_PASSWORD=$(grep DEMO_PASSWORD .env | cut -d '=' -f2 || echo "")

# Test demo login (if enabled)
if grep -q "DEMO_MODE=true" .env; then
    echo -n "✓ Testing demo login... "
    LOGIN_RESPONSE=$(curl -s -X POST http://localhost:3081/api/auth/login \
        -H "Content-Type: application/json" \
        -d "{\"email\":\"${DEMO_EMAIL}\",\"password\":\"${DEMO_PASSWORD}\"}")
    if echo "$LOGIN_RESPONSE" | grep -q "token"; then
        echo "OK"
    else
        echo "FAIL - Demo login not working"
    fi
fi

echo ""
echo "✅ All tests passed!"