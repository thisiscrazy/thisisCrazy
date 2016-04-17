do

function run(msg, matches)
local reply_id = msg['myaboute']

local info = '🔰FirstName : '..msg.from.first_name..'\n\n'
..'🔰Lastname : '..msg.from.last_name..'\n
..'🔰Fullname : '..msg.from.print_name..'\n
..'🔰Id : '..msg.from.id..'\n'
..'🔰Username : @'..msg.from.username..'\n'
..'🔰Msg ID : '..msg.id..'\n'
..'🔰Your Msg : '..msg.text..'\n\n'
..'🔰Group Id : '..msg.to.id..'\n'
..'🔰Group name : '..msg.to.title..'\n'
..'🔰 Your phone : +'..msg.from.phone

reply_msg(reply_id, info, ok_cb, false)
end

return {
patterns = {
"^[!/#]myaboute"

},
run = run
}

end
