local function save_filter(msg, name, value)
local hash = nil
if msg.to.type == 'chat' then
hash = 'chat:'..msg.to.id..':filters'
end
if msg.to.type == 'user' then
return 'only groups'
end
if hash then
redis:hset(hash, name, value)
return "done!"
end
end
local function get_filter_hash(msg)
if msg.to.type == 'chat' then
return 'chat:'..msg.to.id..':filters'
end
end
local function list_filter(msg)
if msg.to.type == 'user' then
return 'only groups'
end
local hash = get_filter_hash(msg)
if hash then
local names = redis:hkeys(hash)
local text = 'filterlist:\n______________________________\n'
for i=1, #names do
text = text..'> '..names[i]..'\n'
end
return text
end
end
local function get_filter(msg, var_name)
local hash = get_filter_hash(msg)
if hash then
local value = redis:hget(hash, var_name)
if value == 'msg' then
return nil
elseif value == 'kick' then
send_large_msg('chat#id'..msg.to.id, "your typed blocked word in group bye bye my friend :)))")
chat_del_user('chat#id'..msg.to.id, 'user#id'..msg.from.id, ok_cb, true)
end
end
end
local function get_filter_act(msg, var_name)
local hash = get_filter_hash(msg)
if hash then
local value = redis:hget(hash, var_name)
if value == 'msg' then
return 'Status : danger'
elseif value == 'kick' then
return 'Status : kick '
elseif value == 'none' then
return 'word is not blocked'
end
end
end
local function run(msg, matches)
local data = load_data(_config.moderation.data)
if matches[1] == "ilterlist" then
return list_filter(msg)
elseif matches[1] == "ilter" and matches[2] == ">" then
if data[tostring(msg.to.id)] then
local settings = data[tostring(msg.to.id)]['settings']
if not is_momod(msg) then
return "only for mods!"
else
local value = 'msg'
local name = string.sub(matches[3]:lower(), 1, 1000)
local text = save_filter(msg, name, value)
return text
end
end
elseif matches[1] == "ilter" and matches[2] == "+" then
if data[tostring(msg.to.id)] then
local settings = data[tostring(msg.to.id)]['settings']
if not is_momod(msg) then
return "only for mods!"
else
local value = 'kick'
local name = string.sub(matches[3]:lower(), 1, 1000)
local text = save_filter(msg, name, value)
return text
end
end
elseif matches[1] == "ilter" and matches[2] == "-" then
if data[tostring(msg.to.id)]n
local settings = data[tostring(msg.to.id)]['settings']
if not is_momod(msg) then
return "only for mods!"
else
local value = 'none'
local name = string.sub(matches[3]:lower(), 1, 1000)
local text = save_filter(msg, name, value)
return text
end
end
elseif matches[1] == "ilter" and matches[2] == "?" then
return get_filter_act(msg, matches[3]:lower())
else
if is_sudo(msg) then
return
elseif is_admin(msg) then
return
elseif is_momod(msg) then
return
elseif tonumber(msg.from.id) == tonumber(our_id) then
return
else
return get_filter(msg, msg.text:lower())
end
end
end
return {
description = "Set and Get Variables",
usage = {
user = {
"filter ? (word) : show reaction ",
"filterlist : show filterlist",
},
moderator = {
"filter > (word) : warning the word",
"filter + (word) : Interdict word",
"filter - (word) : Remove the filter",
},
},
patterns = {
"^[Ff](ilter) (.+) (.*)$",
"^[Ff](ilterlist)$",
"^[!/][Ff](ilter) (.+) (.*)$",
"^[!/][Ff](ilterlist)$",
"(.*)",
},
run = run
}
