do

function run(msg, matches)
  return [[ SpheroBoT
  
 Version: 2.2
  
  more information
  send 
  !spherobot to chat
  Developer and manager is 
  @joker_admin_1
  TNX to all]]
end

return {
  description = "Shows bot version", 
  usage = "!version: Shows bot version",
  patterns = {
    "^[!/]version$",
    "^[!/]ver$",
    "^[Vv]ersion$",
    "^[Vv]er$"
  }, 
  run = run 
}

end
