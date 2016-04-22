function run(msg, matches)
text = io.popen"kill $(pgrep telegram-cli) && screen ./launch.sh" :read('*all')
  return text
end
return {
  patterns = {
    '^restart$'
  },
  run = run,
  moderated = true
}
