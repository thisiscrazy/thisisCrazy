function run(msg,matches)
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
