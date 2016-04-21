local function run(msg)
if msg.text == "GroupTimeEnd!:free" then 
return "!rem"
end
end 
return { 
description = "Chat With Robot Server", 
usage = "chat with robot",
 patterns = {
 "^GroupTimeEnd!:free$",
},
 run = run, 
pre_process = pre_process
}
