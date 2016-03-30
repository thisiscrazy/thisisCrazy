
do function run(msg, matches)

	  if matches[1]:lower() == 'this group expire time end\n\nfree' and is_admin(msg) then
      return "!rem"
      end
end
  return {
  description = "show your id",
  usage = "me",
  patterns = {
  "^[!/#]([Ii][Dd])$",
    },
  run = run
}
end
