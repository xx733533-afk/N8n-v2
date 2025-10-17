# Quick Setup Guide - Deploy n8n for FREE (No Credit Card!)

## 🎉 Using Render.com - 100% Free!

This guide will help you deploy n8n to Render.com in just 5 minutes, completely free without any credit card.

---

## Why Render.com?

- ✅ **100% Free** - No credit card required
- ✅ **750 hours/month** - Enough for 24/7 operation
- ✅ **Permanent HTTPS link** - Professional URL
- ✅ **Auto-deploy from GitHub** - Push and deploy
- ✅ **Easy setup** - Just 5 minutes

---

## Prerequisites

- GitHub account
- That's it! No credit card needed!

---

## Setup Steps

### Step 1: Create Render Account (1 minute)

1. Go to: **https://dashboard.render.com/register**
2. Click **"Sign up with GitHub"**
3. Authorize Render to access your repositories
4. Done! ✅

### Step 2: Create a New Web Service (2 minutes)

1. In your Render Dashboard, click **"New +"** (top right)
2. Select **"Web Service"**
3. Find and connect your repository:
   - Search for: `N8n-v2`
   - Click **"Connect"**

### Step 3: Configure Service (2 minutes)

Fill in the following settings:

**Basic Settings:**
```
Name: my-n8n-web
Region: Frankfurt (EU Central) or closest to you
Branch: main
Runtime: Docker
Instance Type: Free
```

**Environment Variables:**

Click **"Advanced"** then **"Add Environment Variable"** for each:

```
N8N_HOST = 0.0.0.0
N8N_PORT = 5678
N8N_PROTOCOL = https
WEBHOOK_URL = https://my-n8n-web.onrender.com
GENERIC_TIMEZONE = UTC
```

### Step 4: Deploy! (1 minute)

1. Click **"Create Web Service"** at the bottom
2. Wait 3-5 minutes for the first deployment
3. Watch the logs to see progress
4. When you see "Editor is now accessible via: https://..." → Done! ✅

---

## 🌐 Your Permanent Link

After deployment completes, your n8n instance will be available at:

# **https://my-n8n-web.onrender.com**

Open this link and create your owner account!

---

## First Time Setup

1. Open: https://my-n8n-web.onrender.com
2. Create owner account:
   - Enter your email
   - Set a strong password
3. Start creating workflows! 🎉

---

## Important Notes

### Free Tier Includes:

- ✅ 750 hours per month
- ✅ 512MB RAM
- ✅ Permanent HTTPS URL
- ✅ Auto-deploy from GitHub
- ⚠️ **Service sleeps after 15 minutes of inactivity**
- ⚠️ **First request after sleep takes ~30 seconds**

### Preventing Sleep (Optional)

To keep your service active 24/7, use a free cron service:

**Option 1: Cron-job.org (Recommended)**

1. Go to: https://cron-job.org/en/signup
2. Sign up for free
3. Create a new cron job:
   - Title: `n8n keepalive`
   - URL: `https://my-n8n-web.onrender.com/healthz`
   - Schedule: Every 10 minutes
   - Save

**Option 2: UptimeRobot**

1. Go to: https://uptimerobot.com
2. Sign up for free
3. Add New Monitor:
   - Monitor Type: HTTP(s)
   - URL: `https://my-n8n-web.onrender.com/healthz`
   - Monitoring Interval: 5 minutes

Now your n8n will never sleep! ✨

---

## (Optional) Auto-Deploy Setup

To enable automatic deployment when you push to GitHub:

1. In Render Dashboard, go to your service
2. Click **"Settings"**
3. Find **"Deploy Hook"** section
4. Copy the deploy hook URL (starts with `https://api.render.com/deploy/...`)
5. Go to GitHub:
   - https://github.com/xx733533-afk/N8n-v2/settings/secrets/actions
   - Click **"New repository secret"**
   - Name: `RENDER_DEPLOY_HOOK`
   - Value: [paste deploy hook URL]
   - Click **"Add secret"**

Now every push to `main` branch will automatically deploy! 🚀

---

## Monitoring & Management

### View Logs

In Render Dashboard → Your Service → **"Logs"** tab

### Restart Service

In Render Dashboard → Your Service → **"Manual Deploy"** → **"Deploy latest commit"**

### Check Status

In Render Dashboard → Your Service → See status badge (Running/Building/Failed)

---

## Render vs Fly.io Comparison

| Feature | Render | Fly.io |
|---------|--------|--------|
| **Credit Card** | ❌ Not Required | ✅ Required |
| **Free Tier** | ✅ 750 hours | ✅ $5/month credit |
| **Permanent URL** | ✅ Yes | ✅ Yes |
| **RAM** | 512MB | 256-512MB |
| **Auto-Sleep** | ✅ After 15 min | ❌ Always on |
| **First Request** | ~30 seconds | Instant |
| **Setup Difficulty** | ⭐⭐⭐⭐⭐ Easy | ⭐⭐⭐ Medium |

**Conclusion:** Render is perfect for you - free and no credit card needed!

---

## Troubleshooting

### Deployment Failed

- Check the logs in Render Dashboard
- Make sure all environment variables are set correctly
- Try "Manual Deploy" → "Clear build cache & deploy"

### Service Not Responding

- Check if service is sleeping (free tier sleeps after inactivity)
- Set up a cron job to keep it awake
- Check logs for errors

### Need More Resources

If you outgrow the free tier:
- Upgrade to paid plan ($7/month for 512MB RAM, always-on)
- Or migrate to Fly.io for better performance

---

## FAQs

**Q: Will I be charged anything?**  
A: No! The free tier is completely free, no credit card required.

**Q: What happens if I exceed 750 hours?**  
A: 750 hours = 31.25 days. If you run 24/7 = 720 hours/month. You're covered!

**Q: Can I use this for production?**  
A: Yes, for small to medium projects. For high-traffic production, consider upgrading.

**Q: How do I update n8n?**  
A: Just push a change to the repository, or manually deploy from Render Dashboard.

---

## Next Steps

1. ✅ Deploy to Render (follow steps above)
2. ✅ Set up cron job to prevent sleep
3. ✅ Create your first workflow
4. ✅ Enjoy your free n8n instance! 🎉

---

## Additional Resources

- **Render Documentation:** https://render.com/docs/docker
- **n8n Documentation:** https://docs.n8n.io/
- **GitHub Repository:** https://github.com/xx733533-afk/N8n-v2

---

**Everything is ready! Just follow the 4 steps above and you'll have n8n running in 5 minutes! 🚀**
