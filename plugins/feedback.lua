do
 function run(msg, matches)
 local fuse = '#NewFeedback\n\nUsername: @''\n\nUserId : ' .. msg.from.id .. '\n\nGroupId : ' .. msg.to.id .. '\n\nName: ' .. msg.from.print_name .. '\n\nMessage:\n\n'  .. matches[1]
 local fuses = '!printf user#id' .. msg.from.id
 local text = matches[1]
 local sends = send_msg('user#id147696943', fuse, ok_cb, false)
 return 'Your Feedback Sucessfuly Send to Support Sphero!'
 end
end
return {
description = "Feedback",
usage = "feedback message",
patterns = {

 "^[Ff]eedback (.*)$",
 "^[!/][Ff]eedback (.*)$"
 

 },
 run = run
}
