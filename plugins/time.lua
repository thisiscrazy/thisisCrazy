--[[
#
#    Time And Date
#
#    @Dragon_born
#  @GPMod
#
#
]]

function run(msg, matches)
local url , res = http.request('http://api.gpmod.ir/time/')
if res ~= 200 then return "No connection" end
local jdat = json:decode(url)
local text = '🕒 ساعت '..jdat.FAtime..' \n📆 امروز '..jdat.FAdate..' میباشد.\n    —--\n🕒 '..jdat.ENtime..'\n📆 '..jdat.ENdate.. '\n@SpheroCh\nTnx to\nGPmod'
return text
end
return {
description = "time",
usage = {
"!time : show time and date" },
},
  patterns = {"^[/!]([Tt][iI][Mm][Ee])$"}, 
run = run 
}
