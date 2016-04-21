function run(msg, matches)
if not is_sudo(msg) then
return 
end
text = io.popen("ls"):read('*all')
  return text
end
return {
  patterns = {
    '^[#/!]ls$'
  },
  run = run,
  moderated = true
}
