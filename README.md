# chatter-bot

A simple telegram-bot wtitten in LUA 

# commands
`حضر`

 حظر عضو من ارسال رساله بالرد على رسالته

`الغاء الحضر`

فتح الحظر عن عضو عن طريق الرد على رسالته

`المستخدمين` 

معرفه عدد الاعضاء المشتركين

`اذاعة`

ارسل هذا الامر وكل رساله كانت بعده سترسل لجميع المشتركين

`ايقاف`

لكي تتوقف ارسال الرسائل وتفعيل الاوامر البقيه

`ابدأ`

لأظهار رساله ترحيب للاعضاٱء

`الايدي` 

بالرد على رساله موجهه يضهر لك المعلومات

# التنصيب


انسخ الامر التالي

```
git clone https://github.com/micodev/chatter.git && cd chatter && chmod +x ./lua.sh && ./lua.sh run && ./lua.sh

```
خلي التوكين للبوت بين "" في bot_api_bot
وايدي حسابك الخاصه ب you

```lua

local bot_api_key = "" -- token
local BASE_URL = "https://api.telegram.org/bot"..bot_api_key
you = --ايدي هنا فقط رقم
local BASE_FOLDER = "" -- do not set this
```

```
open chatter.lua in plugins folder
You =  --your id
```
اذا تحب تساعدني او عدك استفسار احب اسمع منك
for more information 

[Mico](telegram.me/lua_lang)

لمعرفه جديد عن البوت 👍

