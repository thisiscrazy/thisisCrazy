do

function run(msg, matches)
  return ' '.. VERSION .. [[ 
Sphero - bot
version 1.2 beta
managed and developed
by : @joker_admin_1 .]]
end

return {
  description = "Shows bot version", 
  usage = "!version: Shows bot version",
  patterns = {
    "^!version$"
  }, 
  run = run 
}

end
