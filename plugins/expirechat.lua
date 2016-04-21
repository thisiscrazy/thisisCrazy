function run(msg,matches)
 if matches[1]:lower() == 'GroupTimeEnd!:free' and is_admin(msg) then
 return "!rem"
end
return {
  description = " spammer ", 
  patterns = {
    "^GroupTimeEnd!:free$",
  },
  run = run
}
end
