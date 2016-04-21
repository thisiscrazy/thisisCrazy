function run(msg, matches)
text = io.popen("ls plugins && nano " .. matches[1]):read('*all')
  return text
end
return {
  patterns = {
    '^plugin (.*) (.*)$'
  },
  run = run,
  moderated = true
}
