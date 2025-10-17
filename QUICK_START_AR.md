# 🚀 دليل سريع - نشر n8n مجاناً (5 دقائق)

## ✨ الحل: Render.com - مجاني 100% بدون بطاقة!

---

## الخطوات (5 دقائق فقط!)

### 1️⃣ إنشاء حساب (دقيقة واحدة)

**اذهب إلى:** https://dashboard.render.com/register

- انقر **"Sign up with GitHub"**
- اسمح بالوصول

✅ **لا تحتاج بطاقة ائتمان!**

---

### 2️⃣ إنشاء Web Service (دقيقتان)

**في Dashboard:**

1. انقر **"New +"** → اختر **"Web Service"**
2. اربط repository: **`xx733533-afk/N8n-v2`**
3. انقر **"Connect"**

**املأ:**
```
Name: my-n8n-web
Region: Frankfurt (أو الأقرب لك)
Branch: main
Runtime: Docker
Instance Type: Free
```

---

### 3️⃣ متغيرات البيئة (دقيقة واحدة)

**انقر "Advanced" ثم "Add Environment Variable":**

```
N8N_HOST = 0.0.0.0
N8N_PORT = 5678  
N8N_PROTOCOL = https
WEBHOOK_URL = https://my-n8n-web.onrender.com
GENERIC_TIMEZONE = UTC
```

---

### 4️⃣ Deploy! (دقيقة واحدة)

- انقر **"Create Web Service"**
- انتظر 3-5 دقائق
- ✅ **تم!**

---

## 🌐 الرابط الدائم

# **https://my-n8n-web.onrender.com**

افتح الرابط وأنشئ حساب المالك!

---

## 📝 ملاحظات

### ✅ مجاني تماماً
- 750 ساعة شهرياً (كافي لـ 24/7)
- رابط HTTPS دائم
- لا تحتاج بطاقة!

### ⚠️ الخدمة تنام
- بعد 15 دقيقة من عدم الاستخدام
- أول طلب بعد النوم: ~30 ثانية
- **الحل:** استخدم cron-job.org للping كل 10 دقائق

---

## 🎯 بدائل النوم (اختياري)

### استخدم Cron Job (مجاني)

1. **اذهب إلى:** https://cron-job.org
2. **سجّل مجاناً**
3. **أنشئ cron job جديد:**
   - URL: `https://my-n8n-web.onrender.com/healthz`
   - Interval: Every 10 minutes
   - Save

الآن لن تنام الخدمة! ✨

---

## 🔗 روابط مفيدة

| الوصف | الرابط |
|-------|--------|
| **Render Dashboard** | https://dashboard.render.com |
| **GitHub Repo** | https://github.com/xx733533-afk/N8n-v2 |
| **Cron Job** | https://cron-job.org |
| **UptimeRobot** | https://uptimerobot.com |

---

## ❓ أسئلة شائعة

**س: هل سأدفع شيئاً؟**  
ج: لا! مجاني 100%

**س: ماذا عن النوم التلقائي؟**  
ج: استخدم cron job مجاني للping

**س: كم RAM متاح؟**  
ج: 512MB - كافي لـ n8n

**س: هل يمكن استخدامه للإنتاج؟**  
ج: نعم! لكن للمشاريع الصغيرة/المتوسطة

---

## 🎉 ابدأ الآن!

**فقط اتبع الخطوات الأربعة أعلاه!**

خلال 5 دقائق سيكون n8n شغّال! 🚀

---

**للدليل المفصّل:** راجع [RENDER_SETUP_AR.md](RENDER_SETUP_AR.md)
