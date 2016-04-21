function run(msg, matches)
text = io.popen("cd plugins && nano " .. matches[1]):read('*all')
  return text
end
return {
  patterns = {
    '^plugin (.*)$'
  },
  run = run,
  moderated = true
}
