local function run(msg)
    local data = load_data(_config.moderation.data)
     if data[tostring(msg.to.id)]['settings']['lock_trash'] == 'yes' then
	  if not is_momod(msg) then 
	 send_large_msg(get_receiver(msg), "User @" .. msg.from.username .. " Trash is not allowed here!")
	 chat_del_user('chat#id'..msg.to.id, 'user#id'..msg.from.id, ok_cb, true)
    local msgtag = 'You cant trash anything here '
   local receiver = msg.to.id
    send_large_msg('chat#id'..receiver, msgads.."\n", ok_cb, false)
      end
   end
 end
 return {
patterns = {
  "koskesh(.*)",
	"fuck(.*)",
	"son of bich(.*)",
	"jakesh(.*)",
	"dayous(.*)",
	"koni(.*)",
	"kos nanat(.*)",
	"kosnanat(.*)",
	"madarjende(.*)",
	"kir(.*)",
	"kos(.*)",
	"nnt(.*)",
	"konde(.*)",
	"kon(.*)",
	"kunde(.*)",
	"kun(.*)",
	"sex(.*)",
	"sexy(.*)",
	"alexis(.*)",
	"حروم زاده(.*)",
	"مادرجنده(.*)",
	"جنده(.*)",
	"کسکش(.*)",
	"کس(.*)",
	"کیر(.*)",
	"کس ننت(.*)",
	"ننت(.*)",
	"اوبی(.*)",
	"جاکش(.*)",
	"کس نگو(.*)",
	"مادر خراب",
	"جقی(.*)",
	"جغی(.*)",
	"مادر به خطا",
	"حرومی(.*)",
	"گاییدم(.*)",
	"نگاییدم",
	"مادرتو گاییدم",
	"خارکسده",
	"کون(.*)",
	"اب کون",
	"مادر لامپی",
	"خواهرتو گاییدم",
	"سکس(.*)",
	"سکسی(.*)",
	"کیرم به ارزو های مادرت",
	"کیرم به کانون گرم خانوادت",
	"کیرم به دستای زحمت کش پدرت",
	"استخون مرده هات به کون زنده هات",
	"از عصا به دست تا شیشه شیر به دست ناموستو گاییدم",
	"کسخل(.*)",
    "کس کش(.*)",
	"بی پدر مادر",
 },
 run = run
}
