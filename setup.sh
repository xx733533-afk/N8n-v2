#!/bin/bash

# n8n v2 Deployment Setup Script
# This script will set up your Fly.io app and GitHub secret

set -e

echo "==================================="
echo "n8n v2 Deployment Setup"
echo "==================================="
echo ""

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Check if FLY_API_TOKEN is set
if [ -z "$FLY_API_TOKEN" ]; then
    echo -e "${RED}Error: FLY_API_TOKEN environment variable is not set${NC}"
    echo "Please export your Fly.io API token:"
    echo "  export FLY_API_TOKEN='your-token-here'"
    exit 1
fi

# Check if flyctl is installed
if ! command -v flyctl &> /dev/null; then
    echo -e "${YELLOW}Installing Fly CLI...${NC}"
    curl -L https://fly.io/install.sh | sh
    export FLYCTL_INSTALL="$HOME/.fly"
    export PATH="$FLYCTL_INSTALL/bin:$PATH"
fi

echo -e "${GREEN}✓ Fly CLI is installed${NC}"

# Create Fly.io app
echo ""
echo "Creating Fly.io app 'my-n8n-web'..."
if flyctl apps create my-n8n-web; then
    echo -e "${GREEN}✓ App created successfully${NC}"
else
    echo -e "${YELLOW}⚠ App may already exist or you need to add payment info${NC}"
    echo "Please visit: https://fly.io/dashboard/personal/billing"
fi

# Create volume
echo ""
echo "Creating persistent volume..."
if flyctl volumes create n8n_data --app my-n8n-web --region iad --size 1 --yes; then
    echo -e "${GREEN}✓ Volume created successfully${NC}"
else
    echo -e "${YELLOW}⚠ Volume may already exist${NC}"
fi

# Add GitHub secret
echo ""
echo "Adding FLY_API_TOKEN to GitHub secrets..."
if command -v gh &> /dev/null; then
    if echo "$FLY_API_TOKEN" | gh secret set FLY_API_TOKEN; then
        echo -e "${GREEN}✓ GitHub secret added successfully${NC}"
    else
        echo -e "${YELLOW}⚠ Could not add GitHub secret automatically${NC}"
        echo "Please add it manually:"
        echo "  1. Go to: https://github.com/$(git config --get remote.origin.url | sed 's/.*github.com[:/]\(.*\)\.git/\1/')/settings/secrets/actions"
        echo "  2. Click 'New repository secret'"
        echo "  3. Name: FLY_API_TOKEN"
        echo "  4. Value: Your Fly.io API token"
    fi
else
    echo -e "${YELLOW}⚠ GitHub CLI not found${NC}"
    echo "Please add the GitHub secret manually:"
    echo "  1. Go to your repository Settings → Secrets → Actions"
    echo "  2. Click 'New repository secret'"
    echo "  3. Name: FLY_API_TOKEN"
    echo "  4. Value: Your Fly.io API token"
fi

# Check app status
echo ""
echo "Checking app status..."
flyctl status --app my-n8n-web || echo -e "${YELLOW}App not yet deployed${NC}"

echo ""
echo "==================================="
echo -e "${GREEN}Setup Complete!${NC}"
echo "==================================="
echo ""
echo "Next steps:"
echo "1. If you haven't added payment info to Fly.io, do so at:"
echo "   https://fly.io/dashboard/personal/billing"
echo ""
echo "2. If GitHub secret wasn't added automatically, add it manually"
echo ""
echo "3. Push to main branch to trigger deployment:"
echo "   git add ."
echo "   git commit -m 'Initial deployment'"
echo "   git push origin main"
echo ""
echo "4. Your n8n instance will be available at:"
echo "   https://my-n8n-web.fly.dev/"
echo ""
