# Quick Setup Guide for n8n v2 on Fly.io

## ⚠️ Important: Complete These Steps

Your repository is ready for deployment! Follow these steps to get n8n running:

## Step 1: Add Payment Information to Fly.io

Fly.io requires payment information (even for free tier):

1. Visit: https://fly.io/dashboard/personal/billing
2. Add a credit card
3. Don't worry - the free tier includes enough resources for this n8n instance

## Step 2: Add GitHub Secret

You need to add your Fly.io API token as a GitHub secret:

1. Go to: https://github.com/xx733533-afk/N8n-v2/settings/secrets/actions
2. Click **"New repository secret"**
3. Fill in:
   - **Name**: `FLY_API_TOKEN`
   - **Value**: Your Fly.io API token (the one you provided)
4. Click **"Add secret"**

## Step 3: Create Fly.io App and Volume

Run these commands in your terminal:

```bash
# Set your Fly.io API token
export FLY_API_TOKEN='your-fly-token-here'

# Create the app
flyctl apps create my-n8n-web

# Create persistent volume for data
flyctl volumes create n8n_data --app my-n8n-web --region iad --size 1
```

## Step 4: Deploy!

Once the above steps are complete, simply push to the main branch:

```bash
git add .
git commit -m "Initial deployment"
git push origin main
```

This will trigger the GitHub Action that will:
- Build the n8n Docker image
- Push it to GitHub Container Registry
- Deploy it to Fly.io

## Step 5: Access Your n8n Instance

After deployment completes (check GitHub Actions tab), access n8n at:

**https://my-n8n-web.fly.dev/**

## Alternative: Use the Setup Script

You can also run the automated setup script:

```bash
export FLY_API_TOKEN='your-fly-token-here'
./setup.sh
```

This script will:
- Install Fly CLI (if needed)
- Create the Fly.io app
- Create the volume
- Guide you through adding the GitHub secret

## Troubleshooting

### "Payment information required" error
- Add a credit card at https://fly.io/dashboard/personal/billing

### "Resource not accessible" when adding GitHub secret
- Make sure you're logged into GitHub with the repository owner account
- Use the repository settings page directly: https://github.com/xx733533-afk/N8n-v2/settings/secrets/actions

### Deployment fails
- Check GitHub Actions logs: https://github.com/xx733533-afk/N8n-v2/actions
- Verify the FLY_API_TOKEN secret is set correctly
- Ensure the Fly.io app and volume exist: `flyctl status --app my-n8n-web`

## Next Steps After Deployment

1. Set up your n8n owner account (required on first access)
2. Configure workflows
3. Set up webhooks (they'll work with your permanent URL!)

---

Need help? Check the main [README.md](README.md) for detailed documentation.
