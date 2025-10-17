# ⚠️ إعداد يدوي مطلوب / Manual Setup Required

## 🔴 مشكلتان تحتاج إلى حل / Two Issues Need Resolution

### المشكلة 1: مفتاح GitHub غير صالح / Issue 1: Invalid GitHub Token

المفتاح المقدم غير صالح أو منتهي الصلاحية أو لا يملك الصلاحيات المطلوبة.

The provided token is invalid, expired, or doesn't have required permissions.

**الحل / Solution:**
1. اذهب إلى / Go to: https://github.com/settings/tokens
2. انقر "Generate new token (classic)" / Click "Generate new token (classic)"
3. قم بتفعيل الصلاحيات / Enable permissions:
   - ✅ `repo` (full control)
   - ✅ `workflow` (update GitHub Action workflows)
4. احفظ المفتاح الجديد / Save the new token

### المشكلة 2: Fly.io يتطلب معلومات الدفع / Issue 2: Fly.io Requires Payment Info

Fly.io يتطلب إضافة بطاقة ائتمان حتى مع الخطة المجانية.

Fly.io requires credit card information even for the free tier.

**الحل / Solution:**
1. اذهب إلى / Go to: https://fly.io/dashboard/sjjvgm-gjbv/billing
2. أضف بطاقة ائتمان / Add credit card
3. لا تقلق - الخطة المجانية تغطي هذا التطبيق / Don't worry - free tier covers this app

---

## ✅ الخطوات الكاملة للنشر / Complete Deployment Steps

### الخطوة 1: إضافة السر إلى GitHub / Step 1: Add Secret to GitHub

**الطريقة الأسهل / Easiest Method:**

1. اذهب مباشرة إلى / Go directly to:
   ```
   https://github.com/xx733533-afk/N8n-v2/settings/secrets/actions/new
   ```

2. املأ المعلومات / Fill in:
   - **Name**: `FLY_API_TOKEN`
   - **Secret**: 
   ```
   FlyV1 fm2_lJPECAAAAAAACi33xBAFsrgD22UiQCSCKm+q68PZwrVodHRwczovL2FwaS5mbHkuaW8vdjGUAJLOABOjbx8Lk7lodHRwczovL2FwaS5mbHkuaW8vYWFhL3YxxDxSd/RluhG2aCCHYJdxsb4KX+bjKUNyhZhrF5rqiXRq8mn3LiUShpAlMzlHKFOgwYhbo0jJppOCn0F7o0HETm9tjXNf40Wam9CSO9GRb24nC30aaSj/8o2jyonpxNk0CMHgqHvKXvONfnbuYuIQv/sMYzWceEinhdN54cD/aTOQL4eINF5ic+Vewlgpj8QgUm3DuSA4oeFaXk4qgaR9AMvKRpfmDhdFBUcI2nITsOw=,fm2_lJPETm9tjXNf40Wam9CSO9GRb24nC30aaSj/8o2jyonpxNk0CMHgqHvKXvONfnbuYuIQv/sMYzWceEinhdN54cD/aTOQL4eINF5ic+Vewlgpj8QQXZqPdiVpGwdz9dinNAlX9sO5aHR0cHM6Ly9hcGkuZmx5LmlvL2FhYS92MZgEks5o8lcHzwAAAAEk6nUlF84AEt5uCpHOABLebgzEEI1Y0df5za2nLyIHMeXeUUzEII8xZ6K4JloKXJP2OMegIYtLEj1AwlbL/uyUYBAV1FMi
   ```

3. انقر "Add secret" / Click "Add secret"

### الخطوة 2: إضافة معلومات الدفع لـ Fly.io / Step 2: Add Payment to Fly.io

1. اذهب إلى / Go to: https://fly.io/dashboard/sjjvgm-gjbv/billing
2. انقر "Add payment method" / Click "Add payment method"
3. أدخل معلومات البطاقة / Enter card details
4. احفظ / Save

### الخطوة 3: إنشاء التطبيق والقرص على Fly.io / Step 3: Create App and Volume on Fly.io

**على جهازك المحلي / On your local machine:**

```bash
# ثبت Fly CLI (إذا لم يكن مثبتاً) / Install Fly CLI (if not installed)
curl -L https://fly.io/install.sh | sh

# اضبط المفتاح / Set the token
export FLY_API_TOKEN='FlyV1 fm2_lJPECAAAAAAACi33xBAFsrgD22UiQCSCKm+q68PZwrVodHRwczovL2FwaS5mbHkuaW8vdjGUAJLOABOjbx8Lk7lodHRwczovL2FwaS5mbHkuaW8vYWFhL3YxxDxSd/RluhG2aCCHYJdxsb4KX+bjKUNyhZhrF5rqiXRq8mn3LiUShpAlMzlHKFOgwYhbo0jJppOCn0F7o0HETm9tjXNf40Wam9CSO9GRb24nC30aaSj/8o2jyonpxNk0CMHgqHvKXvONfnbuYuIQv/sMYzWceEinhdN54cD/aTOQL4eINF5ic+Vewlgpj8QgUm3DuSA4oeFaXk4qgaR9AMvKRpfmDhdFBUcI2nITsOw=,fm2_lJPETm9tjXNf40Wam9CSO9GRb24nC30aaSj/8o2jyonpxNk0CMHgqHvKXvONfnbuYuIQv/sMYzWceEinhdN54cD/aTOQL4eINF5ic+Vewlgpj8QQXZqPdiVpGwdz9dinNAlX9sO5aHR0cHM6Ly9hcGkuZmx5LmlvL2FhYS92MZgEks5o8lcHzwAAAAEk6nUlF84AEt5uCpHOABLebgzEEI1Y0df5za2nLyIHMeXeUUzEII8xZ6K4JloKXJP2OMegIYtLEj1AwlbL/uyUYBAV1FMi'

# أنشئ التطبيق / Create the app
flyctl apps create my-n8n-web

# أنشئ القرص / Create the volume
flyctl volumes create n8n_data --app my-n8n-web --region iad --size 1
```

### الخطوة 4: تفعيل النشر / Step 4: Trigger Deployment

بعد إكمال الخطوات 1-3، قم بتفعيل النشر يدوياً:

After completing steps 1-3, manually trigger deployment:

1. اذهب إلى / Go to: https://github.com/xx733533-afk/N8n-v2/actions
2. انقر على "Build and Deploy n8n to Fly.io" / Click "Build and Deploy n8n to Fly.io"
3. انقر "Run workflow" / Click "Run workflow"
4. انقر "Run workflow" الأخضر / Click green "Run workflow"

---

## 🌐 الرابط الدائم / Permanent Link

بعد اكتمال النشر (3-5 دقائق)، سيكون n8n متاحاً على:

After deployment completes (3-5 minutes), n8n will be available at:

# **https://my-n8n-web.fly.dev/**

---

## 📊 المتابعة / Monitoring

- **حالة النشر / Deployment status**: https://github.com/xx733533-afk/N8n-v2/actions
- **لوحة Fly.io / Fly.io dashboard**: https://fly.io/dashboard
- **السجلات / Logs**: `flyctl logs --app my-n8n-web`
- **الحالة / Status**: `flyctl status --app my-n8n-web`

---

## ✅ قائمة التحقق / Checklist

- [ ] إضافة `FLY_API_TOKEN` إلى أسرار GitHub
- [ ] إضافة معلومات الدفع إلى Fly.io
- [ ] تشغيل `flyctl apps create my-n8n-web`
- [ ] تشغيل `flyctl volumes create n8n_data ...`
- [ ] تفعيل workflow من GitHub Actions
- [ ] الوصول إلى https://my-n8n-web.fly.dev/

---

## 🎯 ملخص / Summary

**الحالة الحالية / Current Status:**
- ✅ المستودع جاهز / Repository ready
- ✅ صورة Docker تعمل / Docker image works
- ✅ GitHub Actions نشط / GitHub Actions active
- ⚠️ يحتاج: سر GitHub / Needs: GitHub secret
- ⚠️ يحتاج: معلومات دفع Fly.io / Needs: Fly.io payment
- ⚠️ يحتاج: إنشاء التطبيق / Needs: App creation

**بعد الإعداد اليدوي / After manual setup:**
- 🚀 النشر التلقائي سيعمل / Auto-deployment will work
- 🔗 رابط دائم متاح 24/7 / Permanent link 24/7
- ✨ كل تحديث ينشر تلقائياً / Every update auto-deploys

---

**للأسئلة / For questions:**
- الوثائق الكاملة / Full docs: `README.md`
- دليل سريع / Quick guide: `SETUP_GUIDE.md`
