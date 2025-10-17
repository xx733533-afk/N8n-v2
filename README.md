# My n8n Web - Automated Deployment to Fly.io

This repository contains a fully automated n8n v2 deployment setup using Docker, GitHub Actions, and Fly.io. Once configured, n8n will run 24/7 with a permanent public web link.

> **🚀 Quick Start**: See [SETUP_GUIDE.md](SETUP_GUIDE.md) for step-by-step instructions!

## 🚀 Features

- **n8n v2**: Latest stable version of n8n workflow automation
- **Automated Deployment**: Push to `main` branch triggers automatic deployment
- **24/7 Availability**: Runs continuously on Fly.io infrastructure
- **Persistent Storage**: Data is stored in a Fly.io volume
- **HTTPS Enabled**: Secure connection with automatic SSL certificates
- **Permanent Public Link**: Access your n8n instance at `https://my-n8n-web.fly.dev/`

## 📋 Prerequisites

Before you begin, you'll need:

1. A [GitHub account](https://github.com/signup)
2. A [Fly.io account](https://fly.io/app/sign-up) (free tier available)
3. [Git](https://git-scm.com/downloads) installed on your computer
4. [Fly CLI](https://fly.io/docs/hands-on/install-flyctl/) installed

## 🛠️ Setup Instructions

### Step 1: Install Fly CLI

#### On macOS/Linux:
```bash
curl -L https://fly.io/install.sh | sh
```

#### On Windows (PowerShell):
```powershell
pwsh -Command "iwr https://fly.io/install.ps1 -useb | iex"
```

#### Verify installation:
```bash
flyctl version
```

### Step 2: Login to Fly.io

```bash
flyctl auth login
```

This will open a browser window for you to authenticate.

### Step 3: Create Fly.io App

```bash
flyctl apps create my-n8n-web
```

**Note**: The app name `my-n8n-web` must match the `app` field in `fly.toml`. If you want to use a different name, update the `app` field in `fly.toml` and the `WEBHOOK_URL` environment variable.

### Step 4: Create Persistent Volume

Create a volume for n8n data persistence:

```bash
flyctl volumes create n8n_data --region iad --size 1
```

**Note**: Region `iad` (Virginia, USA) is used by default. You can change it to a region closer to you. See available regions with `flyctl platform regions`.

### Step 5: Get Fly.io API Token

```bash
flyctl auth token
```

Copy the token that is displayed.

### Step 6: Configure GitHub Repository Secrets

1. Go to your GitHub repository
2. Navigate to **Settings** → **Secrets and variables** → **Actions**
3. Click **New repository secret**
4. Add the following secret:
   - **Name**: `FLY_API_TOKEN`
   - **Value**: Paste the token from Step 5

### Step 7: Push to GitHub

```bash
# Initialize git repository (if not already done)
git init

# Add all files
git add .

# Commit
git commit -m "Initial commit: n8n automated deployment setup"

# Add your GitHub repository as remote
git remote add origin https://github.com/YOUR_USERNAME/my-n8n-web.git

# Push to main branch
git push -u origin main
```

**Important**: Replace `YOUR_USERNAME` with your actual GitHub username.

### Step 8: Monitor Deployment

1. Go to your GitHub repository
2. Click on the **Actions** tab
3. Watch the deployment workflow run

Once completed, your n8n instance will be live!

## 🌐 Access Your n8n Instance

Your n8n instance will be accessible at:

```
https://my-n8n-web.fly.dev/
```

**Note**: If you changed the app name, your URL will be `https://YOUR_APP_NAME.fly.dev/`

## 📝 First Time Setup

When you first access your n8n instance:

1. You'll be prompted to create an owner account
2. Set a strong email and password
3. Configure your workflow automation!

## 🔧 Configuration

### Environment Variables

You can customize n8n by editing the `[env]` section in `fly.toml`:

```toml
[env]
  N8N_HOST = "0.0.0.0"
  N8N_PORT = "5678"
  N8N_PROTOCOL = "https"
  WEBHOOK_URL = "https://my-n8n-web.fly.dev/"
  GENERIC_TIMEZONE = "UTC"
```

### Scaling

To upgrade your instance's resources:

```bash
# Scale memory
flyctl scale memory 1024

# Scale CPU
flyctl scale vm shared-cpu-2x
```

## 🔄 Updating n8n

n8n will automatically update when you push changes to the `main` branch. To trigger a rebuild:

```bash
git commit --allow-empty -m "Trigger rebuild"
git push
```

## 📊 Monitoring

### View Logs
```bash
flyctl logs
```

### Check App Status
```bash
flyctl status
```

### SSH into Container
```bash
flyctl ssh console
```

## 🛡️ Security Recommendations

1. **Change Default Credentials**: Immediately set up owner account on first access
2. **Use Strong Passwords**: Enable strong authentication
3. **Regular Backups**: Consider backing up the n8n volume data
4. **Update Regularly**: Keep n8n updated to the latest version

## 💰 Cost Considerations

Fly.io offers:
- **Free Tier**: Includes 3 shared-cpu-1x VMs with 256MB RAM each
- **Paid Plans**: Start at $5/month for always-on applications

This configuration uses:
- 1 shared CPU
- 512MB RAM
- 1GB persistent storage

With the free tier, you may need to adjust the VM size or use auto-stop/start.

## 🐛 Troubleshooting

### Deployment Fails

1. Check GitHub Actions logs in the **Actions** tab
2. Verify `FLY_API_TOKEN` secret is set correctly
3. Ensure Fly.io app was created: `flyctl apps list`

### App Not Accessible

1. Check app status: `flyctl status`
2. View logs: `flyctl logs`
3. Verify DNS: `nslookup my-n8n-web.fly.dev`

### Volume Issues

List volumes:
```bash
flyctl volumes list
```

Delete and recreate if needed:
```bash
flyctl volumes delete n8n_data
flyctl volumes create n8n_data --region iad --size 1
```

## 📚 Additional Resources

- [n8n Documentation](https://docs.n8n.io/)
- [Fly.io Documentation](https://fly.io/docs/)
- [GitHub Actions Documentation](https://docs.github.com/en/actions)

## 📄 License

This project configuration is open source and available under the MIT License.

## 🤝 Contributing

Feel free to open issues or submit pull requests for improvements!

---

**Happy Automating! 🎉**
