# 🌐 رابط n8n الدائم / n8n Permanent Link

## الرابط المباشر / Direct Link

بعد إكمال الإعداد، سيكون n8n متاحاً على:

After completing setup, n8n will be available at:

# **https://my-n8n-web.fly.dev/**

---

## ⚠️ خطوات مطلوبة قبل الوصول / Required Steps Before Access

### 1️⃣ إضافة GitHub Secret

اذهب إلى / Go to: https://github.com/xx733533-afk/N8n-v2/settings/secrets/actions/new

- **الاسم / Name**: `FLY_API_TOKEN`
- **القيمة / Value**: مفتاح Fly.io الخاص بك / Your Fly.io token

### 2️⃣ إضافة بطاقة ائتمان لـ Fly.io

اذهب إلى / Go to: https://fly.io/dashboard/sjjvgm-gjbv/billing

### 3️⃣ إنشاء التطبيق والقرص

```bash
export FLY_API_TOKEN='your-fly-token'
flyctl apps create my-n8n-web
flyctl volumes create n8n_data --app my-n8n-web --region iad --size 1
```

### 4️⃣ تفعيل النشر

اذهب إلى / Go to: https://github.com/xx733533-afk/N8n-v2/actions

انقر "Run workflow" / Click "Run workflow"

---

## 📱 روابط مهمة / Important Links

| الوصف / Description | الرابط / Link |
|---------------------|---------------|
| تطبيق n8n / n8n App | https://my-n8n-web.fly.dev/ |
| GitHub Actions | https://github.com/xx733533-afk/N8n-v2/actions |
| إضافة Secret / Add Secret | https://github.com/xx733533-afk/N8n-v2/settings/secrets/actions |
| Fly.io الفوترة / Billing | https://fly.io/dashboard/sjjvgm-gjbv/billing |
| Fly.io Dashboard | https://fly.io/dashboard |

---

## ⏱️ وقت النشر / Deployment Time

بعد تفعيل workflow:
- البناء / Build: ~2-3 دقائق / minutes
- النشر / Deploy: ~1-2 دقائق / minutes
- **الإجمالي / Total: 3-5 دقائق / minutes**

---

## ✅ التحقق من النشر / Verify Deployment

```bash
# تحقق من حالة التطبيق / Check app status
flyctl status --app my-n8n-web

# شاهد السجلات / View logs
flyctl logs --app my-n8n-web

# افتح في المتصفح / Open in browser
flyctl open --app my-n8n-web
```

---

## 🎯 الإعداد الأول / First Time Setup

عند الوصول لأول مرة / On first access:

1. افتح / Open: https://my-n8n-web.fly.dev/
2. قم بإنشاء حساب المالك / Create owner account
3. أدخل البريد الإلكتروني وكلمة المرور / Enter email and password
4. ابدأ في إنشاء workflows! / Start creating workflows!

---

**الرابط الدائم سيعمل 24/7 بعد النشر! 🚀**

**Permanent link will work 24/7 after deployment! 🚀**
