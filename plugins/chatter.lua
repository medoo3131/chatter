do
local function chatter(msg,mico)
help = [[
➖➖➖➖➖➖➖➖➖➖➖
*commands:*`for admin`
`حضر` ✴️
*حظر عضو من ارسال رساله بالرد على رسالته*
`الغاء الحضر` ✴️
*فتح الحظر عن عضو عن طريق الرد على رسالته*
`المستخدمين` ✴️
*معرفه عدد الاعضاء المشتركين*
`اذاعة` ✴️
*ارسل هذا الامر وكل رساله كانت بعده سترسل لجميع المشتركين*
`ايقاف` ✴️
*لكي تتوقف ارسال الرسائل وتفعيل الاوامر البقيه*
`ابدأ` ✴️
*لأظهار رساله ترحيب للاعضاٱء*
`الايدي` ✴️
*بالرد على رساله موجهه يضهر لك المعلومات*
➖➖➖➖➖➖➖➖➖➖➖
]]
start = [[]]
You = 86309574
if mico[1] == "start" and not is_add(msg) then
local keyboard = {}

    keyboard.inline_keyboard = {

		{
		{text = 'How to use me ', callback_data = 'help'},
		},

	}
	key = JSON.encode(keyboard)
 	table.insert(add.id,msg.from.id)
 	 	local user = ""
if msg.from.username == nil then
user = bot.username
else
user = msg.from.username
end
local text = "مرحبا بك يا ["..msg.from.first_name.."](www.telegram.me/"..user..")"
sendMessage(msg.chat.id,text.."\n"..start,true,false,true,key)
elseif msg.text == "ابدأ" and is_add(msg) then
local keyboard = {}

    keyboard.inline_keyboard = {

		{
		{text = 'How to use me ', callback_data = 'help'},
		},

	}
	key = JSON.encode(keyboard)
 	local user = ""
if msg.from.username == nil then
user = bot.username
else
user = msg.from.username
end
local text = "مرحبا بك يا ["..msg.from.first_name.."](www.telegram.me/"..user..")"
sendMessage(msg.chat.id,text.."\n"..start,true,false,true,key)
elseif is_admin(msg) and msg.text == "المستخدمين" then
 	local r = tostring(#add.id)

 	local t = string.gsub(r," ","")
sendMessage(You,t,true,false,true)
end


if mico[1] == 'in:help' and is_admin(msg) then
editMessageText(msg.chat.id,msg.message_id,help,nil,true)
end
if is_ban(msg) then return end
if msg.date < os.time() - 5 then -- Ignore old msgs
		return
end
if msg.text == "ايقاف" then
  add.broadcast = "broadcast"
  save_data('mico.db', add)
  sendMessage(msg.chat.id,"*تــم ايقــاف الاذاعــة 📧*",true,false,true)
end
if msg.text ~= "اذاعة" and  add.broadcast ~= "broadcast" then
if is_admin(msg) then
if msg.text and msg.text ~= "ايقاف" then
for k,v in pairs(add.id) do
sendMessage(v,msg.text,true,false,true)
end

elseif not msg.text then
for k,v in pairs(add.id) do
forwardMessage(v,You,msg.message_id)
end
end
end
elseif msg.text ~= "/" then
if is_admin(msg) and msg.reply_to_message and msg.reply_to_message.forward_from ~= nil and msg.text == "حضر" then
table.insert(ban.id,msg.reply_to_message.forward_from.id)
sendMessage(msg.reply_to_message.forward_from.id,"*تــم حضــرك من اســخــدام البــوت 👞❌*",true,false,true)
elseif is_admin(msg) and msg.reply_to_message and msg.reply_to_message.forward_from ~= nil and msg.text == "الغاء الحضر" then
for k, v in pairs(ban["id"]) do
if ( v == msg.reply_to_message.forward_from.id ) then
table.remove(ban["id"], k)
end
end
sendMessage(msg.reply_to_message.forward_from.id,"*تــم الســماح لك باســخــدام البــوت ✅🌀*",true,false,true)
elseif is_admin(msg) and msg.reply_to_message and msg.text == "الايدي" then
 if msg.reply_to_message.forward_from.last_name ~= nil then
 	 last_name = msg.reply_to_message.forward_from.last_name
 else
 	 last_name = ""
 end
 if msg.reply_to_message.forward_from.username ~= nil then
 	 usernme = "\nالمعرف : @"..msg.reply_to_message.forward_from.username
 else
 	 usernme = ""
 end
 local E = "الاسم : "..msg.reply_to_message.forward_from.first_name.." "..last_name..usernme.."\nالايدي :"..msg.reply_to_message.forward_from.id
 sendMessage(msg.chat.id,E)

elseif is_admin(msg) and msg.text == "اذاعة" then

  add.broadcast = "unbroadcast"
    sendMessage(msg.chat.id,"*الآن قــم بكتــابة ما تــريد ارســاله للمســخــدمــين 📩*",true,false,true)
save_data('mico.db', add)


elseif not is_ban(msg) and msg.text ~= "ابدأ" and msg.text ~= "الايدي" and msg.text ~= "الغاء الحضر" and msg.text ~= "حضر" and mico[1] == "#@reply@#" then

if is_admin(msg) and msg.reply_to_message and mico[1] == "#@reply@#" then
forwardMessage(msg.reply_to_message.forward_from.id,msg.from.id,msg.message_id)

end
end
end

end
return {


patterns = {


"حضر",
"الغاء الحضر",
"(in:help)",
"المستخدمين",
"اذاعة",
"ايقاف",
"(ابدأ)",
"/(about)",
"الايدي",
"(#@reply@#)",
},

chatter = chatter
}

end
