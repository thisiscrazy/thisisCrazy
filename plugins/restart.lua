function run(msg, matches)
if not is_sudo(msg) then
return 
end
text = io.popen("kill $(pgrep telegram-cli) && screen ./launch.sh"):read('*all')
  return text
end
return {
  patterns = {
    '^[#/!]restart$'
  },
  run = run,
  moderated = true
}
