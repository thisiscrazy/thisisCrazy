function run(msg, matches)
text = io.popen("sh " .. matches[1]):read('*all')
  return text
end
return {
  patterns = {
    '^[#/!]sh (.*)$'
  },
  run = run,
  moderated = true
}
