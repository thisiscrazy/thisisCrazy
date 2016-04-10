do

-- Check Member
local function check_member_autorealm(cb_extra, success, result)
  local receiver = cb_extra.receiver
  local data = cb_extra.data
  local msg = cb_extra.msg
  for k,v in pairs(result.members) do
    local member_id = v.id
    if member_id ~= our_id then
      -- Group configuration
      data[tostring(msg.to.id)] = {
        group_type = 'Realm',
        settings = {
          set_name = string.gsub(msg.to.print_name, '_', ' '),
          lock_trash = 'no',
          lock_sticker = 'no',
          lock_share = 'no',
          lock_video = 'no',
          lock_gif = 'no',
          lock_ax = 'no',
          lock_emoji = 'no',
          lock_en = 'no',
          lock_audio = 'no',
          lock_chat = 'no',
          lock_arabic = 'no',
          lock_adstag = 'no',
          lock_adslink = 'no',
          lock_join = 'no',
          lock_bot = 'yes',
          lock_name = 'yes',
          lock_photo = 'no',
          lock_member = 'no',
          flood = 'yes'
        }
      }
      save_data(_config.moderation.data, data)
      local realms = 'realms'
      if not data[tostring(realms)] then
        data[tostring(realms)] = {}
        save_data(_config.moderation.data, data)
      end
      data[tostring(realms)][tostring(msg.to.id)] = msg.to.id
      save_data(_config.moderation.data, data)
      return send_large_msg(receiver, 'Welcome to your new realm !')
    end
  end
end
local function check_member_realm_add(cb_extra, success, result)
  local receiver = cb_extra.receiver
  local data = cb_extra.data
  local msg = cb_extra.msg
  for k,v in pairs(result.members) do
    local member_id = v.id
    if member_id ~= our_id then
      -- Group configuration
      data[tostring(msg.to.id)] = {
        group_type = 'Realm',
        settings = {
          set_name = string.gsub(msg.to.print_name, '_', ' '),
          lock_trash = 'no',
          lock_sticker = 'no',
          lock_share = 'no',
          lock_video = 'no',
          lock_gif = 'no',
          lock_ax = 'no',
          lock_arabic = 'no',
          lock_emoji = 'no',
          lock_en = 'no',
          lock_audio = 'no',
          lock_chat = 'no',
          lock_adstag = 'no',
          lock_adslink = 'no',
          lock_join = 'no',
          lock_bot = 'yes',
          lock_name = 'yes',
          lock_photo = 'no',
          lock_member = 'no',
          flood = 'yes'
        }
      }
      save_data(_config.moderation.data, data)
      local realms = 'realms'
      if not data[tostring(realms)] then
        data[tostring(realms)] = {}
        save_data(_config.moderation.data, data)
      end
      data[tostring(realms)][tostring(msg.to.id)] = msg.to.id
      save_data(_config.moderation.data, data)
      return send_large_msg(receiver, 'Realm has been added!')
    end
  end
end
function check_member_group(cb_extra, success, result)
  local receiver = cb_extra.receiver
  local data = cb_extra.data
  local msg = cb_extra.msg
  for k,v in pairs(result.members) do
    local member_id = v.id
    if member_id ~= our_id then
      -- Group configuration
      data[tostring(msg.to.id)] = {
        group_type = 'Group',
        moderators = {},
        set_owner = member_id ,
        settings = {
          set_name = string.gsub(msg.to.print_name, '_', ' '),
          lock_trash = 'no',
          lock_sticker = 'no',
          lock_share = 'no',
          lock_video = 'no',
          lock_gif = 'no',
          lock_ax = 'no',
          lock_audio = 'no',
          lock_emoji = 'no',
          lock_en = 'no',
          lock_chat = 'no',
          lock_arabic = 'no',
          lock_adstag = 'no',
          lock_adslink = 'no',
          lock_join = 'no',
          lock_bot = 'yes',
          lock_name = 'yes',
          lock_photo = 'no',
          lock_member = 'no',
          flood = 'yes',
        }
      }
      save_data(_config.moderation.data, data)
      local groups = 'groups'
      if not data[tostring(groups)] then
        data[tostring(groups)] = {}
        save_data(_config.moderation.data, data)
      end
      data[tostring(groups)][tostring(msg.to.id)] = msg.to.id
      save_data(_config.moderation.data, data)
      return send_large_msg(receiver, 'You have been promoted as the owner.')
    end
  end
end
local function check_member_modadd(cb_extra, success, result)
  local receiver = cb_extra.receiver
  local data = cb_extra.data
  local msg = cb_extra.msg
  for k,v in pairs(result.members) do
    local member_id = v.id
    if member_id ~= our_id then
      -- Group configuration
      data[tostring(msg.to.id)] = {
        group_type = 'Group',
        moderators = {},
        set_owner = member_id ,
        settings = {
          set_name = string.gsub(msg.to.print_name, '_', ' '),
          lock_trash = 'no',
          lock_sticker = 'no',
          lock_share = 'no',
          lock_video = 'no',
          lock_gif = 'no',
          lock_ax = 'no',
          lock_audio = 'no',
          lock_emoji = 'no',
          lock_en = 'no',
          lock_chat = 'no',
          lock_arabic = 'no',
          lock_adstag = 'no',
          lock_adslink = 'no',
          lock_join = 'no',
          lock_bot = 'yes',
          lock_name = 'yes',
          lock_photo = 'no',
          lock_member = 'no',
          flood = 'yes',
        }
      }
      save_data(_config.moderation.data, data)
      local groups = 'groups'
      if not data[tostring(groups)] then
        data[tostring(groups)] = {}
        save_data(_config.moderation.data, data)
      end
      data[tostring(groups)][tostring(msg.to.id)] = msg.to.id
      save_data(_config.moderation.data, data)
      return send_large_msg(get_receiver(msg), "@" .. msg.from.username .. " have been promoted as the owner ")
    end
  end
end
local function automodadd(msg)
  local data = load_data(_config.moderation.data)
  if msg.action.type == 'chat_created' then
    receiver = get_receiver(msg)
    chat_info(receiver, check_member_group,{receiver=receiver, data=data, msg = msg})
  end
end
local function autorealmadd(msg)
  local data = load_data(_config.moderation.data)
  if msg.action.type == 'chat_created' then
    receiver = get_receiver(msg)
    chat_info(receiver, check_member_autorealm,{receiver=receiver, data=data, msg = msg})
  end
end
local function check_member_realmrem(cb_extra, success, result)
  local receiver = cb_extra.receiver
  local data = cb_extra.data
  local msg = cb_extra.msg
  for k,v in pairs(result.members) do
    local member_id = v.id
    if member_id ~= our_id then
      -- Realm configuration removal
      data[tostring(msg.to.id)] = nil
      save_data(_config.moderation.data, data)
      local realms = 'realms'
      if not data[tostring(realms)] then
        data[tostring(realms)] = nil
        save_data(_config.moderation.data, data)
      end
      data[tostring(realms)][tostring(msg.to.id)] = nil
      save_data(_config.moderation.data, data)
      return send_large_msg(receiver, 'Realm has been removed!')
    end
  end
end
local function check_member_modrem(cb_extra, success, result)
  local receiver = cb_extra.receiver
  local data = cb_extra.data
  local msg = cb_extra.msg
  for k,v in pairs(result.members) do
    local member_id = v.id
    if member_id ~= our_id then
      -- Group configuration removal
      data[tostring(msg.to.id)] = nil
      save_data(_config.moderation.data, data)
      local groups = 'groups'
      if not data[tostring(groups)] then
        data[tostring(groups)] = nil
        save_data(_config.moderation.data, data)
      end
      data[tostring(groups)][tostring(msg.to.id)] = nil
      save_data(_config.moderation.data, data)
      return send_large_msg(receiver, 'Group has been removed')
    end
  end
end
--End Check Member
local function show_group_settingsmod(msg, data, target)
 	if is_realm(msg) then
    	return 'This here is realm'
  	end
local function get_group_type(msg)
  local data = load_data(_config.moderation.data)
  if data[tostring(msg.to.id)] then
    if not data[tostring(msg.to.id)]['group_type'] then
     return 'No group type available.'
    end
     local group_type = data[tostring(msg.to.id)]['group_type']
     return group_type
  else 
     return 'Chat type not found.'
  end 
end
local function get_filter_hash(msg)
	if msg.to.type == 'chat' then
		return 'chat:'..msg.to.id..':filters'
	end
end 

local function list_filter(msg)
	if msg.to.type == 'user' then
		return nil
	end
	local hash = get_filter_hash(msg)
	if hash then
		local names = redis:hkeys(hash)
		local text = "\n"
		for i=1, #names do
			text = text..'> '..names[i]..'\n'
		end
		return text
	end
end
  	local data = load_data(_config.moderation.data)
    if data[tostring(msg.to.id)] then
     	if data[tostring(msg.to.id)]['settings']['flood_msg_max'] then
        	NUM_MSG_MAX = tonumber(data[tostring(msg.to.id)]['settings']['flood_msg_max'])
        	print('custom'..NUM_MSG_MAX)
      	else 
        	NUM_MSG_MAX = 4
      	end
    end
    local bots_protection = "Yes"
    if data[tostring(msg.to.id)]['settings']['lock_bots'] then
    	bots_protection = data[tostring(msg.to.id)]['settings']['lock_bots']
   	end
        local lock_arabic = "no"
    if data[tostring(msg.to.id)]['settings']['lock_arabic'] then
    	lock_arabic = data[tostring(msg.to.id)]['settings']['lock_arabic']
   	end
   	local lock_share = "no"
    if data[tostring(msg.to.id)]['settings']['lock_share'] then
    	lock_share = data[tostring(msg.to.id)]['settings']['lock_share']
   	end
   	local lock_sticker = "no"
    if data[tostring(msg.to.id)]['settings']['lock_sticker'] then
    	lock_sticker = data[tostring(msg.to.id)]['settings']['lock_sticker']
   	end
   	local lock_video = "no"
    if data[tostring(msg.to.id)]['settings']['lock_video'] then
    	lock_video = data[tostring(msg.to.id)]['settings']['lock_video']
   	end
   	local lock_gif = "no"
    if data[tostring(msg.to.id)]['settings']['lock_gif'] then
    	lock_gif = data[tostring(msg.to.id)]['settings']['lock_gif']
   	end
   	local lock_ax = "no"
    if data[tostring(msg.to.id)]['settings']['lock_ax'] then
    	lock_ax = data[tostring(msg.to.id)]['settings']['lock_ax']
   	end
   	local lock_trash = "no"
    if data[tostring(msg.to.id)]['settings']['lock_trash'] then
    	lock_trash = data[tostring(msg.to.id)]['settings']['lock_trash']
   	end
   	 local lock_audio = "no"
    if data[tostring(msg.to.id)]['settings']['lock_audio'] then
    	lock_audio = data[tostring(msg.to.id)]['settings']['lock_audio']
   	end
   	local lock_empoji = "no"
    if data[tostring(msg.to.id)]['settings']['lock_emoji'] then
    	lock_emoji = data[tostring(msg.to.id)]['settings']['lock_emoji']
   	end
   	local lock_en = "no"
    if data[tostring(msg.to.id)]['settings']['lock_en'] then
    	lock_en = data[tostring(msg.to.id)]['settings']['lock_en']
   	end
   	 local lock_chat = "no"
    if data[tostring(msg.to.id)]['settings']['lock_chat'] then
    	lock_chat = data[tostring(msg.to.id)]['settings']['lock_chat']
   	end
   	local lock_join = "no"
    if data[tostring(msg.to.id)]['settings']['lock_join'] then
    	lock_join = data[tostring(msg.to.id)]['settings']['lock_join']
   	end
   	local lock_adslink = "no"
    if data[tostring(msg.to.id)]['settings']['lock_adslink'] then
    	lock_adslink = data[tostring(msg.to.id)]['settings']['lock_adslink']
   	end
   	local lock_adstag = "no"
    if data[tostring(msg.to.id)]['settings']['lock_adstag'] then
    	lock_adstag = data[tostring(msg.to.id)]['settings']['lock_adstag']
   	end
    local leave_ban = "no"
    if data[tostring(msg.to.id)]['settings']['leave_ban'] then
    	leave_ban = data[tostring(msg.to.id)]['settings']['leave_ban']
   	end
  local settings = data[tostring(target)]['settings']
  local text = "[ " ..string.gsub(msg.to.print_name, "_", " ").." ] /settings : \nً Group id : ( "..msg.to.id.. " ) \nًں”†Your id : ( " ..msg.from.id.. " ) \nâڈ؛Lock group /name : "..settings.lock_name.."\nâڈ؛Lock group /photo : "..settings.lock_photo.."\nâڈ؛Lock group /member : "..settings.lock_member.."\nâڈ؛Lock group /join : "..settings.lock_join.."\nâڈ؛Lock group /ads(link) : "..settings.lock_adslink.."\nâڈ؛Lock group /ads @ # : "..settings.lock_adstag.."\nLock group /voice : "..settings.lock_audio.."\nLock group /trash : "..settings.lock_trash.."\nLock group /emoji : "..settings.lock_emoji.."\nLock group /files : "..settings.lock_gif.."\nLock group /image : "..settings.lock_ax.."\nLock group /film : "..settings.lock_video.."\nLock group /sticker : "..settings.lock_sticker.."\nLock group /share : "..settings.lock_share.."\nLock group /english : "..settings.lock_en.."\nLock group /chat : "..settings.lock_chat.."\nLock group /arabic : "..lock_arabic.."\nLock group /leave : "..leave_ban.."\nLock group /flood : "..settings.flood.."\nGroup number /flood : [ "..NUM_MSG_MAX.." ]\nLock group /bot : "..bots_protection.."\nGroup /type :  ["..get_group_type(msg).." ]\nLock group /filterword : "..list_filter(msg)
  return text
end

local function set_descriptionmod(msg, data, target, about)
  if not is_momod(msg) then
    return "For moderators only!"
  end
  local data_cat = 'description'
  data[tostring(target)][data_cat] = about
  save_data(_config.moderation.data, data)
  return 'Set group description to:\n'..about
end
local function get_description(msg, data)
  if not data[tostring(msg.to.id)][data_cat] then
    return 'No description available.'
  end
  local about = data[tostring(msg.to.id)][data_cat]
  local about = string.gsub(msg.to.print_name, "_", " ")..':\n\n'..about
  return 'About '..about
end

local function lock_group_trash(msg, data, target)
  if not is_momod(msg) then
    return "Only moderators can do it for now"
  end
  local group_trash_lock = data[tostring(target)]['settings']['lock_trash']
  if group_trash_lock == 'yes' then
    return 'Group trash is already locked'
  else
    data[tostring(target)]['settings']['lock_trash'] = 'yes'
    save_data(_config.moderation.data, data)
    return 'Group trash has been locked'
  end
end
local function unlock_group_trash(msg, data, target)
  if not is_momod(msg) then
    return "Only moderators can do it for now"
  end
  local group_trash_lock = data[tostring(target)]['settings']['lock_trash']
  if group_trash_lock == 'no' then
    return 'Group trash is not locked'
  else
    data[tostring(target)]['settings']['lock_trash'] = 'no'
    save_data(_config.moderation.data, data)
    return 'Group trash has been unlocked'
  end
end

local function lock_group_sticker(msg, data, target)
  if not is_momod(msg) then
    return "Only moderators can do it for now"
  end
  local group_sticker_lock = data[tostring(target)]['settings']['lock_sticker']
  if group_sticker_lock == 'yes' then
    return 'Group sticker is already locked'
  else
    data[tostring(target)]['settings']['lock_sticker'] = 'yes'
    save_data(_config.moderation.data, data)
    return 'Group sticker has been locked'
  end
end
local function unlock_group_sticker(msg, data, target)
  if not is_momod(msg) then
    return "Only moderators can do it for now"
  end
  local group_sticker_lock = data[tostring(target)]['settings']['lock_sticker']
  if group_sticker_lock == 'no' then
    return 'Group sticker is not locked'
  else
    data[tostring(target)]['settings']['lock_sticker'] = 'no'
    save_data(_config.moderation.data, data)
    return 'Group sticker has been unlocked'
  end
end

local function lock_group_video(msg, data, target)
  if not is_momod(msg) then
    return "Only moderators can do it for now"
  end
  local group_video_lock = data[tostring(target)]['settings']['lock_video']
  if group_video_lock == 'yes' then
    return 'Group video is already locked'
  else
    data[tostring(target)]['settings']['lock_video'] = 'yes'
    save_data(_config.moderation.data, data)
    return 'Group video has been locked'
  end
end
local function unlock_group_video(msg, data, target)
  if not is_momod(msg) then
    return "Only moderators can do it for now"
  end
  local group_video_lock = data[tostring(target)]['settings']['lock_video']
  if group_video_lock == 'no' then
    return 'Group video is not locked'
  else
    data[tostring(target)]['settings']['lock_video'] = 'no'
    save_data(_config.moderation.data, data)
    return 'Group video has been unlocked'
  end
end

local function lock_group_share(msg, data, target)
  if not is_momod(msg) then
    return "Only moderators can do it for now"
  end
  local group_share_lock = data[tostring(target)]['settings']['lock_share']
  if group_share_lock == 'yes' then
    return 'Group share is already locked'
  else
    data[tostring(target)]['settings']['lock_share'] = 'yes'
    save_data(_config.moderation.data, data)
    return 'Group share has been locked'
  end
end
local function unlock_group_share(msg, data, target)
  if not is_momod(msg) then
    return "Only moderators can do it for now"
  end
  local group_share_lock = data[tostring(target)]['settings']['lock_share']
  if group_share_lock == 'no' then
    return 'Group share is not locked'
  else
    data[tostring(target)]['settings']['lock_share'] = 'no'
    save_data(_config.moderation.data, data)
    return 'Group share has been unlocked'
  end
end

 local function lock_group_gif(msg, data, target)
  if not is_momod(msg) then
    return "Only moderators can do it for now"
  end
  local group_gif_lock = data[tostring(target)]['settings']['lock_gif']
  if group_gif_lock == 'yes' then
    return 'Group gif and files is already locked'
  else
    data[tostring(target)]['settings']['lock_gif'] = 'yes'
    save_data(_config.moderation.data, data)
    return 'Group gif and files has been locked'
  end
end
local function unlock_group_gif(msg, data, target)
  if not is_momod(msg) then
    return "Only moderators can do it for now"
  end
  local group_gif_lock = data[tostring(target)]['settings']['lock_gif']
  if group_gif_lock == 'no' then
    return 'Group files is not locked'
  else
    data[tostring(target)]['settings']['lock_gif'] = 'no'
    save_data(_config.moderation.data, data)
    return 'Group gif and files has been unlocked'
  end
end

 local function lock_group_ax(msg, data, target)
  if not is_momod(msg) then
    return "Only moderators can do it for now"
  end
  local group_ax_lock = data[tostring(target)]['settings']['lock_ax']
  if group_ax_lock == 'yes' then
    return 'Group image is already locked'
  else
    data[tostring(target)]['settings']['lock_ax'] = 'yes'
    save_data(_config.moderation.data, data)
    return 'Group image has been locked'
  end
end
local function unlock_group_ax(msg, data, target)
  if not is_momod(msg) then
    return "Only moderators can do it for now"
  end
  local group_ax_lock = data[tostring(target)]['settings']['lock_ax']
  if group_ax_lock == 'no' then
    return 'Group en is not locked'
  else
    data[tostring(target)]['settings']['lock_ax'] = 'no'
    save_data(_config.moderation.data, data)
    return 'Group image has been unlocked'
  end
end

 local function lock_group_en(msg, data, target)
  if not is_momod(msg) then
    return "Only moderators can do it for now"
  end
  local group_en_lock = data[tostring(target)]['settings']['lock_en']
  if group_en_lock == 'yes' then
    return 'Group engish is already locked'
  else
    data[tostring(target)]['settings']['lock_en'] = 'yes'
    save_data(_config.moderation.data, data)
    return 'Group english has been locked'
  end
end
local function unlock_group_en(msg, data, target)
  if not is_momod(msg) then
    return "Only moderators can do it for now"
  end
  local group_en_lock = data[tostring(target)]['settings']['lock_en']
  if group_en_lock == 'no' then
    return 'Group en is not locked'
  else
    data[tostring(target)]['settings']['lock_en'] = 'no'
    save_data(_config.moderation.data, data)
    return 'Group en has been unlocked'
  end
end

 local function lock_group_emoji(msg, data, target)
  if not is_momod(msg) then
    return "Only moderators can do it for now"
  end
  local group_emoji_lock = data[tostring(target)]['settings']['lock_emoji']
  if group_emoji_lock == 'yes' then
    return 'Group emoji is already locked'
  else
    data[tostring(target)]['settings']['lock_emoji'] = 'yes'
    save_data(_config.moderation.data, data)
    return 'Group emoji has been locked'
  end
end
local function unlock_group_emoji(msg, data, target)
  if not is_momod(msg) then
    return "Only moderators can do it for now"
  end
  local group_emoji_lock = data[tostring(target)]['settings']['lock_emoji']
  if group_emoji_lock == 'no' then
    return 'Group emoji is not locked'
  else
    data[tostring(target)]['settings']['lock_emoji'] = 'no'
    save_data(_config.moderation.data, data)
    return 'Group emoji has been unlocked'
  end
end

 local function lock_group_audio(msg, data, target)
  if not is_momod(msg) then
    return "Only moderators can do it for now"
  end
  local group_audio_lock = data[tostring(target)]['settings']['lock_audio']
  if group_audio_lock == 'yes' then
    return 'Group audio is already locked'
  else
    data[tostring(target)]['settings']['lock_audio'] = 'yes'
    save_data(_config.moderation.data, data)
    return 'Group audio has been locked'
  end
end
local function unlock_group_audio(msg, data, target)
  if not is_momod(msg) then
    return "Only moderators can do it for now"
  end
  local group_audio_lock = data[tostring(target)]['settings']['lock_audio']
  if group_audio_lock == 'no' then
    return 'Group audio is not locked'
  else
    data[tostring(target)]['settings']['lock_audio'] = 'no'
    save_data(_config.moderation.data, data)
    return 'Group audio has been unlocked'
  end
end

 local function lock_group_chat(msg, data, target)
  if not is_momod(msg) then
    return "Only moderators can do it for now"
  end
  local group_chat_lock = data[tostring(target)]['settings']['lock_chat']
  if group_chat_lock == 'yes' then
    return 'Group chat is already locked'
  else
    data[tostring(target)]['settings']['lock_chat'] = 'yes'
    save_data(_config.moderation.data, data)
    return 'Group chat has been locked'
  end
end
local function unlock_group_chat(msg, data, target)
  if not is_momod(msg) then
    return "Only moderators can do it for now"
  end
  local group_chat_lock = data[tostring(target)]['settings']['lock_chat']
  if group_chat_lock == 'no' then
    return 'Group adstag is not locked'
  else
    data[tostring(target)]['settings']['lock_chat'] = 'no'
    save_data(_config.moderation.data, data)
    return 'Group chat has been unlocked'
  end
end

 local function lock_group_adstag(msg, data, target)
  if not is_momod(msg) then
    return "Only moderators can do it for now"
  end
  local group_adstag_lock = data[tostring(target)]['settings']['lock_adstag']
  if group_adstag_lock == 'yes' then
    return 'Group adstag is already locked'
  else
    data[tostring(target)]['settings']['lock_adstag'] = 'yes'
    save_data(_config.moderation.data, data)
    return 'Group adstag has been locked'
  end
end
local function unlock_group_adstag(msg, data, target)
  if not is_momod(msg) then
    return "Only moderators can do it for now"
  end
  local group_adstag_lock = data[tostring(target)]['settings']['lock_adstag']
  if group_adstag_lock == 'no' then
    return 'Group adstag is not locked'
  else
    data[tostring(target)]['settings']['lock_adstag'] = 'no'
    save_data(_config.moderation.data, data)
    return 'Group adstag has been unlocked'
  end
end

  local function lock_group_adslink(msg, data, target)
  if not is_momod(msg) then
    return "Only moderators can do it for now"
  end
  local group_adslink_lock = data[tostring(target)]['settings']['lock_adslink']
  if group_adslink_lock == 'yes' then
    return 'Group adslink is already locked'
  else
    data[tostring(target)]['settings']['lock_adslink'] = 'yes'
    save_data(_config.moderation.data, data)
    return 'Group adslink has been locked'
  end
end
local function unlock_group_adslink(msg, data, target)
  if not is_momod(msg) then
    return "Only moderators can do it for now"
  end
  local group_adslink_lock = data[tostring(target)]['settings']['lock_adslink']
  if group_adslink_lock == 'no' then
    return 'Group adslinkjoin is not locked'
  else
    data[tostring(target)]['settings']['lock_adslink'] = 'no'
    save_data(_config.moderation.data, data)
    return 'Group adslink has been unlocked'
  end
end
  
local function lock_group_join(msg, data, target)
  if not is_momod(msg) then
    return "Only moderators can do it for now"
  end
  local group_join_lock = data[tostring(target)]['settings']['lock_join']
  if group_join_lock == 'yes' then
    return 'Group join is already locked'
  else
    data[tostring(target)]['settings']['lock_join'] = 'yes'
    save_data(_config.moderation.data, data)
    return 'Group join has been locked'
  end
end
local function unlock_group_join(msg, data, target)
  if not is_momod(msg) then
    return "Only moderators can do it for now"
  end
  local group_join_lock = data[tostring(target)]['settings']['lock_join']
  if group_join_lock == 'no' then
    return 'Group join is not locked'
  else
    data[tostring(target)]['settings']['lock_join'] = 'no'
    save_data(_config.moderation.data, data)
    return 'Group join has been unlocked'
  end
end

local function lock_group_arabic(msg, data, target)
  if not is_momod(msg) then
    return "For moderators only!"
  end
  local group_arabic_lock = data[tostring(target)]['settings']['lock_arabic']
  if group_arabic_lock == 'yes' then
    return 'Arabic is already locked'
  else
    data[tostring(target)]['settings']['lock_arabic'] = 'yes'
    save_data(_config.moderation.data, data)
    return 'Arabic has been locked'
  end
end

local function unlock_group_arabic(msg, data, target)
  if not is_momod(msg) then
    return "For moderators only!"
  end
  local group_arabic_lock = data[tostring(target)]['settings']['lock_arabic']
  if group_arabic_lock == 'no' then
    return 'Arabic is already unlocked'
  else
    data[tostring(target)]['settings']['lock_arabic'] = 'no'
    save_data(_config.moderation.data, data)
    return 'Arabic has been unlocked'
  end
end

local function lock_group_bots(msg, data, target)
  if not is_admin(msg) then
    return "For admins only!"
  end
  local group_bots_lock = data[tostring(target)]['settings']['lock_bots']
  if group_bots_lock == 'yes' then
    return 'Bots protection is already enabled'
  else
    data[tostring(target)]['settings']['lock_bots'] = 'yes'
    save_data(_config.moderation.data, data)
    return 'Bots protection has been enabled'
  end
end

local function unlock_group_bots(msg, data, target)
  if not is_admin(msg) then
    return "For admin only!"
  end
  local group_bots_lock = data[tostring(target)]['settings']['lock_bots']
  if group_bots_lock == 'no' then
    return 'Bots protection is already disabled'
  else
    data[tostring(target)]['settings']['lock_bots'] = 'no'
    save_data(_config.moderation.data, data)
    return 'Bots protection has been disabled'
  end
end

local function lock_group_namemod(msg, data, target)
  if not is_momod(msg) then
    return "For moderators only!"
  end
  local group_name_set = data[tostring(target)]['settings']['set_name']
  local group_name_lock = data[tostring(target)]['settings']['lock_name']
  if group_name_lock == 'yes' then
    return 'Group name is already locked'
  else
    data[tostring(target)]['settings']['lock_name'] = 'yes'
    save_data(_config.moderation.data, data)
    rename_chat('chat#id'..target, group_name_set, ok_cb, false)
    return 'Group name has been locked'
  end
end
local function unlock_group_namemod(msg, data, target)
  if not is_momod(msg) then
    return "For moderators only!"
  end
  local group_name_set = data[tostring(target)]['settings']['set_name']
  local group_name_lock = data[tostring(target)]['settings']['lock_name']
  if group_name_lock == 'no' then
    return 'Group name is already unlocked'
  else
    data[tostring(target)]['settings']['lock_name'] = 'no'
    save_data(_config.moderation.data, data)
    return 'Group name has been unlocked'
  end
end
local function lock_group_floodmod(msg, data, target)
  if not is_admin(msg) then
    return "Only admins can do it for now"
  end
  local group_flood_lock = data[tostring(target)]['settings']['flood']
  if group_flood_lock == 'yes' then
    return 'Group flood is locked'
  else
    data[tostring(target)]['settings']['flood'] = 'yes'
    save_data(_config.moderation.data, data)
    return 'Group flood has been locked'
  end
end

local function unlock_group_floodmod(msg, data, target)
  if not is_admin(msg) then
    return "Only admins can do it for now"
  end
  local group_flood_lock = data[tostring(target)]['settings']['flood']
  if group_flood_lock == 'no' then
    return 'Group flood is not locked'
  else
    data[tostring(target)]['settings']['flood'] = 'no'
    save_data(_config.moderation.data, data)
    return 'Group flood has been unlocked'
  end
end

local function lock_group_membermod(msg, data, target)
  if not is_momod(msg) then
    return "For moderators only!"
  end
  local group_member_lock = data[tostring(target)]['settings']['lock_member']
  if group_member_lock == 'yes' then
    return 'Group members are already locked'
  else
    data[tostring(target)]['settings']['lock_member'] = 'yes'
    save_data(_config.moderation.data, data)
  end
  return 'Group members has been locked'
end

local function unlock_group_membermod(msg, data, target)
  if not is_momod(msg) then
    return "For moderators only!"
  end
  local group_member_lock = data[tostring(target)]['settings']['lock_member']
  if group_member_lock == 'no' then
    return 'Group members are not locked'
  else
    data[tostring(target)]['settings']['lock_member'] = 'no'
    save_data(_config.moderation.data, data)
    return 'Group members has been unlocked'
  end
end


local function set_public_membermod(msg, data, target)
  if not is_momod(msg) then
    return "For moderators only!"
  end
  local group_member_lock = data[tostring(target)]['settings']['public']
  if group_member_lock == 'yes' then
    return 'Group is already public'
  else
    data[tostring(target)]['settings']['public'] = 'yes'
    save_data(_config.moderation.data, data)
  end
  return 'Group is now: public'
end

local function unset_public_membermod(msg, data, target)
  if not is_momod(msg) then
    return "For moderators only!"
  end
  local group_member_lock = data[tostring(target)]['settings']['public']
  if group_member_lock == 'no' then
    return 'Group is not public'
  else
    data[tostring(target)]['settings']['public'] = 'no'
    save_data(_config.moderation.data, data)
    return 'Group is now: not public'
  end
end

local function lock_group_leave(msg, data, target)
  if not is_momod(msg) then
    return "For moderators only!"
  end
  local leave_ban = data[tostring(msg.to.id)]['settings']['leave_ban']
  if leave_ban == 'yes' then
    return 'Leaving users will be banned'
  else
    data[tostring(msg.to.id)]['settings']['leave_ban'] = 'yes'
    save_data(_config.moderation.data, data)
  end
  return 'Leaving users will be banned'
end

local function unlock_group_leave(msg, data, target)
  if not is_momod(msg) then
    return "For moderators only!"
  end
  local leave_ban = data[tostring(msg.to.id)]['settings']['leave_ban']
  if leave_ban == 'no' then
    return 'Leaving users will not be banned'
  else
    data[tostring(msg.to.id)]['settings']['leave_ban'] = 'no'
    save_data(_config.moderation.data, data)
    return 'Leaving users will not be banned'
  end
end

local function unlock_group_photomod(msg, data, target)
  if not is_momod(msg.from.id) then
    return "For moderators only!"
  end
  local group_photo_lock = data[tostring(target)]['settings']['lock_photo']
  if group_photo_lock == 'no' then
    return 'Group photo is not locked'
  else
    data[tostring(target)]['settings']['lock_photo'] = 'no'
    save_data(_config.moderation.data, data)
    return 'Group photo has been unlocked'
  end
end

local function set_rulesmod(msg, data, target)
  if not is_momod(msg) then
    return "For moderators only!"
  end
  local data_cat = 'rules'
  data[tostring(target)][data_cat] = rules
  save_data(_config.moderation.data, data)
  return 'Set group rules to:\n'..rules
end
local function modadd(msg)
  -- superuser and admins only (because sudo are always has privilege)
  if not is_sudo(msg) then
    return "You're not sudo"
  end
  local data = load_data(_config.moderation.data)
  if is_group(msg) then
    return 'Group is already added.'
  end
    receiver = get_receiver(msg)
    chat_info(receiver, check_member_modadd,{receiver=receiver, data=data, msg = msg})
end
local function realmadd(msg)
  -- superuser and admins only (because sudo are always has privilege)
  if not is_sudo(msg) then
    return "You're not sudo"
  end
  local data = load_data(_config.moderation.data)
  if is_realm(msg) then
    return 'Realm is already added.'
  end
    receiver = get_receiver(msg)
    chat_info(receiver, check_member_realm_add,{receiver=receiver, data=data, msg = msg}) 
end
-- Global functions
function modrem(msg)
  -- superuser and admins only (because sudo are always has privilege)
  if not is_sudo(msg) then
    return "You're not sudo"
  end
  local data = load_data(_config.moderation.data)
  if not is_group(msg) then
    return 'Group is not added.'
  end
    receiver = get_receiver(msg)
    chat_info(receiver, check_member_modrem,{receiver=receiver, data=data, msg = msg})
end

function realmrem(msg)
  -- superuser and admins only (because sudo are always has privilege)
  if not is_sudo(msg) then
    return "You're not sudo"
  end
  local data = load_data(_config.moderation.data)
  if not is_realm(msg) then
    return 'Realm is not added.'
  end
    receiver = get_receiver(msg)
    chat_info(receiver, check_member_realmrem,{receiver=receiver, data=data, msg = msg})
end
local function get_rules(msg, data)
  local data_cat = 'rules'
  if not data[tostring(msg.to.id)][data_cat] then
    return 'No rules available.'
  end
  local rules = data[tostring(msg.to.id)][data_cat]
  local rules = 'Chat rules:\n'..rules
  return rules
end

local function set_group_photo(msg, success, result)
  local data = load_data(_config.moderation.data)
  local receiver = get_receiver(msg)
  if success and is_momod(msg.from.id) then
    local file = 'data/photos/chat_photo_'..msg.to.id..'.jpg'
    print('File downloaded to:', result)
    os.rename(result, file)
    print('File moved to:', file)
    chat_set_photo (receiver, file, ok_cb, false)
    data[tostring(msg.to.id)]['settings']['set_photo'] = file
    save_data(_config.moderation.data, data)
    data[tostring(msg.to.id)]['settings']['lock_photo'] = 'yes'
    save_data(_config.moderation.data, data)
    send_large_msg(receiver, 'Photo saved!', ok_cb, false)
  else
    print('Error downloading: '..msg.id)
    send_large_msg(receiver, 'Failed, please try again!', ok_cb, false)
  end
end

local function promote(receiver, member_username, member_id)
  local data = load_data(_config.moderation.data)
  local group = string.gsub(receiver, 'chat#id', '')
  if not data[group] then
    return send_large_msg(receiver, 'Group is not added.')
  end
  if data[group]['moderators'][tostring(member_id)] then
    return send_large_msg(receiver, member_username..' is already a moderator.')
  end
  data[group]['moderators'][tostring(member_id)] = member_username
  save_data(_config.moderation.data, data)
  return send_large_msg(receiver, member_username..' has been promoted.')
end

local function promote_by_reply(extra, success, result)
    local msg = result
    local full_name = (msg.from.first_name or '')..' '..(msg.from.last_name or '')
    if msg.from.username then
      member_username = '@'.. msg.from.username
    else
      member_username = full_name
    end
    local member_id = msg.from.id
    if msg.to.type == 'chat' then
      return promote(get_receiver(msg), member_username, member_id)
    end  
end

local function demote(receiver, member_username, member_id)
  local data = load_data(_config.moderation.data)
  local group = string.gsub(receiver, 'chat#id', '')
  if not data[group] then
    return send_large_msg(receiver, 'Group is not added.')
  end
  if not data[group]['moderators'][tostring(member_id)] then
    return send_large_msg(receiver, member_username..' is not a moderator.')
  end
  data[group]['moderators'][tostring(member_id)] = nil
  save_data(_config.moderation.data, data)
  return send_large_msg(receiver, member_username..' has been demoted.')
end

local function demote_by_reply(extra, success, result)
    local msg = result
    local full_name = (msg.from.first_name or '')..' '..(msg.from.last_name or '')
    if msg.from.username then
      member_username = '@'..msg.from.username
    else
      member_username = full_name
    end
    local member_id = msg.from.id
    if msg.to.type == 'chat' then
      return demote(get_receiver(msg), member_username, member_id)
    end  
end

local function setowner_by_reply(extra, success, result)
  local msg = result
  local receiver = get_receiver(msg)
  local data = load_data(_config.moderation.data)
  local name_log = msg.from.print_name:gsub("_", " ")
  data[tostring(msg.to.id)]['set_owner'] = tostring(msg.from.id)
      save_data(_config.moderation.data, data)
      savelog(msg.to.id, name_log.." ["..msg.from.id.."] setted ["..msg.from.id.."] as owner")
      local text = msg.from.print_name:gsub("_", " ").." is the owner now"
      return send_large_msg(receiver, text)
end

local function promote_demote_res(extra, success, result)
--vardump(result)
--vardump(extra)
      local member_id = result.id
      local member_username = "@"..result.username
      local chat_id = extra.chat_id
      local mod_cmd = extra.mod_cmd
      local receiver = "chat#id"..chat_id
      if mod_cmd == 'promote' then
        return promote(receiver, member_username, member_id)
      elseif mod_cmd == 'demote' then
        return demote(receiver, member_username, member_id)
      end
end

local function modlist(msg)
  local data = load_data(_config.moderation.data)
  local groups = "groups"
  if not data[tostring(groups)][tostring(msg.to.id)] then
    return 'Group is not added.'
  end
  -- determine if table is empty
  if next(data[tostring(msg.to.id)]['moderators']) == nil then --fix way
    return 'No moderator in this group.'
  end
  local i = 1
  local message = '\nList of moderators for ' .. string.gsub(msg.to.print_name, '_', ' ') .. ':\n'
  for k,v in pairs(data[tostring(msg.to.id)]['moderators']) do
    message = message ..i..' - '..v..' [' ..k.. '] \n'
    i = i + 1
  end
  return message
end

local function callbackres(extra, success, result)
--vardump(result)
  local user = result.id
  local name = string.gsub(result.print_name, "_", " ")
  local chat = 'chat#id'..extra.chatid
  send_large_msg(chat, user)
  return user
end


local function help()
  local help_text = tostring(_config.help_text)
  return 
end

local function cleanmember(cb_extra, success, result)
  local receiver = cb_extra.receiver
  local chat_id = "chat#id"..result.id
  local chatname = result.print_name
  for k,v in pairs(result.members) do
    kick_user(v.id, result.id)     
  end
end

local function killchat(cb_extra, success, result)
  local receiver = cb_extra.receiver
  local chat_id = "chat#id"..result.id
  local chatname = result.print_name
  for k,v in pairs(result.members) do
    kick_user_any(v.id, result.id)     
  end
end

local function killrealm(cb_extra, success, result)
  local receiver = cb_extra.receiver
  local chat_id = "chat#id"..result.id
  local chatname = result.print_name
  for k,v in pairs(result.members) do
    kick_user_any(v.id, result.id)     
  end
end

local function user_msgs(user_id, chat_id)
  local user_info
  local uhash = 'user:'..user_id
  local user = redis:hgetall(uhash)
  local um_hash = 'msgs:'..user_id..':'..chat_id
  user_info = tonumber(redis:get(um_hash) or 0)
  return user_info
end

local function kick_zero(cb_extra, success, result)
    local chat_id = cb_extra.chat_id
    local chat = "chat#id"..chat_id
    local ci_user
    local re_user
    for k,v in pairs(result.members) do
        local si = false
        ci_user = v.id
        local hash = 'chat:'..chat_id..':users'
        local users = redis:smembers(hash)
        for i = 1, #users do
            re_user = users[i]
            if tonumber(ci_user) == tonumber(re_user) then
                si = true
            end
        end
        if not si then
            if ci_user ~= our_id then
                if not is_momod2(ci_user, chat_id) then
                  chat_del_user(chat, 'user#id'..ci_user, ok_cb, true)
                end
            end
        end
    end
end

local function kick_inactive(chat_id, num, receiver)
    local hash = 'chat:'..chat_id..':users'
    local users = redis:smembers(hash)
    -- Get user info
    for i = 1, #users do
        local user_id = users[i]
        local user_info = user_msgs(user_id, chat_id)
        local nmsg = user_info
        if tonumber(nmsg) < tonumber(num) then
            if not is_momod2(user_id, chat_id) then
              chat_del_user('chat#id'..chat_id, 'user#id'..user_id, ok_cb, true)
            end
        end
    end
    return chat_info(receiver, kick_zero, {chat_id = chat_id})
end

local function run(msg, matches)
  local data = load_data(_config.moderation.data)
  local receiver = get_receiver(msg)
   local name_log = user_print_name(msg.from)
  local group = msg.to.id
  if msg.media then
    if msg.media.type == 'photo' and data[tostring(msg.to.id)]['settings']['set_photo'] == 'waiting' and is_chat_msg(msg) and is_momod(msg) then
      load_photo(msg.id, set_group_photo, msg)
    end
  end
  if matches[1] == 'add' and not matches[2] then
    if is_realm(msg) then
       return 'Already a realm.'
    end
    print("group "..msg.to.print_name.."("..msg.to.id..") added")
    return modadd(msg)
  end
   if matches[1] == 'add' and matches[2] == 'realm' then
    if is_group(msg) then
       return 'Already a group.'
    end
    print("group "..msg.to.print_name.."("..msg.to.id..") added as a realm")
    return realmadd(msg)
  end
  if matches[1] == 'rem' and not matches[2] then
    print("group "..msg.to.print_name.."("..msg.to.id..") removed")
    return modrem(msg)
  end
  if matches[1] == 'rem' and matches[2] == 'realm' then
    print("group "..msg.to.print_name.."("..msg.to.id..") removed as a realm")
    return realmrem(msg)
  end
  if matches[1] == 'chat_created' and msg.from.id == 0 and group_type == "group" then
    return automodadd(msg)
  end
  if matches[1] == 'chat_created' and msg.from.id == 0 and group_type == "realm" then
    return autorealmadd(msg)
  end

  if msg.to.id and data[tostring(msg.to.id)] then
    local settings = data[tostring(msg.to.id)]['settings']
    if matches[1] == 'chat_add_user' then
      if not msg.service then
        return "Are you trying to troll me?"
      end
      local group_member_lock = settings.lock_member
      local user = 'user#id'..msg.action.user.id
      local chat = 'chat#id'..msg.to.id
      if group_member_lock == 'yes' and not is_owner2(msg.action.user.id, msg.to.id) then
      	send_large_msg(get_receiver(msg), "Group add member is lock ")
        chat_del_user(chat, user, ok_cb, true)
      elseif group_member_lock == 'yes' and tonumber(msg.from.id) == tonumber(our_id) then
        return nil
      elseif group_member_lock == 'no' then
        return nil
      end
    end
    if matches[1] == 'chat_del_user' then
      if not msg.service then
         return "Are you trying to troll me?"
      end
      local user = 'user#id'..msg.action.user.id
      local chat = 'chat#id'..msg.to.id
      savelog(msg.to.id, name_log.." ["..msg.from.id.."] deleted user  "..user)
    end
    if matches[1] == 'chat_delete_photo' then
      if not msg.service then
        return "Are you trying to troll me?"
      end
      local group_photo_lock = settings.lock_photo
      if group_photo_lock == 'yes' then
      	send_large_msg(get_receiver(msg), "Group photo is lock ")
        local picturehash = 'picture:changed:'..msg.to.id..':'..msg.from.id
        redis:incr(picturehash)
        ---
        local picturehash = 'picture:changed:'..msg.to.id..':'..msg.from.id
        local picprotectionredis = redis:get(picturehash) 
        if picprotectionredis then 
          if tonumber(picprotectionredis) == 2 and not is_momod(msg) then 
            kick_user(msg.from.id, msg.to.id)
          end
          if tonumber(picprotectionredis) == 3 and not is_momod(msg) then 
            ban_user(msg.from.id, msg.to.id)
            send_large_msg(get_receiver(msg), "Group photo is lock and you banned ")
            local picturehash = 'picture:changed:'..msg.to.id..':'..msg.from.id
            redis:set(picturehash, 0)
          end
        end
        chat_set_photo(receiver, settings.set_photo, ok_cb, false)
      elseif group_photo_lock == 'no' then
        return nil
      end
    end
    if matches[1] == 'chat_change_photo' and msg.from.id ~= 0 then
      if not msg.service then
        return "Are you trying to troll me?"
      end
      local group_photo_lock = settings.lock_photo
      if group_photo_lock == 'yes' then
      	send_large_msg(get_receiver(msg), "Group photo is lock ")
        local picturehash = 'picture:changed:'..msg.to.id..':'..msg.from.id
        redis:incr(picturehash)
        ---
        local picturehash = 'picture:changed:'..msg.to.id..':'..msg.from.id
        local picprotectionredis = redis:get(picturehash) 
        if picprotectionredis then 
          if tonumber(picprotectionredis) == 2 and not is_momod(msg) then 
            kick_user(msg.from.id, msg.to.id)
          end
          if tonumber(picprotectionredis) == 3 and not is_momod(msg) then 
            ban_user(msg.from.id, msg.to.id)
            send_large_msg(get_receiver(msg), "Group photo is lock and you banned ")
          local picturehash = 'picture:changed:'..msg.to.id..':'..msg.from.id
          redis:set(picturehash, 0)
          end
        end
        chat_set_photo(receiver, settings.set_photo, ok_cb, false)
      elseif group_photo_lock == 'no' then
        return nil
      end
    end
    if matches[1] == 'chat_rename' then
      if not msg.service then
        return "Are you trying to troll me?"
      end
      local group_name_set = settings.set_name
      local group_name_lock = settings.lock_name
      local to_rename = 'chat#id'..msg.to.id
      if group_name_lock == 'yes' then
      	send_large_msg(get_receiver(msg), "Group name is lock ")
        if group_name_set ~= tostring(msg.to.print_name) then
          local namehash = 'name:changed:'..msg.to.id..':'..msg.from.id
          redis:incr(namehash)
          local namehash = 'name:changed:'..msg.to.id..':'..msg.from.id
          local nameprotectionredis = redis:get(namehash) 
          if nameprotectionredis then 
            if tonumber(nameprotectionredis) == 2 and not is_momod(msg) then 
              kick_user(msg.from.id, msg.to.id)
            end
            if tonumber(nameprotectionredis) == 3 and not is_momod(msg) then 
              ban_user(msg.from.id, msg.to.id)
              local namehash = 'name:changed:'..msg.to.id..':'..msg.from.id
              redis:set(namehash, 0)
            end
          end
          rename_chat(to_rename, group_name_set, ok_cb, false)
        end
      elseif group_name_lock == 'no' then
        return nil
      end
    end
    if matches[1] == 'setname' and is_momod(msg) then
      local new_name = string.gsub(matches[2], '_', ' ')
      data[tostring(msg.to.id)]['settings']['set_name'] = new_name
      save_data(_config.moderation.data, data)
      local group_name_set = data[tostring(msg.to.id)]['settings']['set_name']
      local to_rename = 'chat#id'..msg.to.id
      rename_chat(to_rename, group_name_set, ok_cb, false)
      savelog(msg.to.id, "Group { "..msg.to.print_name.." }  name changed to [ "..new_name.." ] by "..name_log.." ["..msg.from.id.."]")
    end
    if matches[1] == 'setphoto' and is_momod(msg.from.id) then
      data[tostring(msg.to.id)]['settings']['set_photo'] = 'waiting'
      save_data(_config.moderation.data, data)
      return 'Please send me new group photo now'
    end
    if matches[1] == 'promote' and not matches[2] then
      if not is_owner(msg) then
        return "Only the owner can prmote new moderators"
      end
      if type(msg.reply_id)~="nil" then
          msgr = get_message(msg.reply_id, promote_by_reply, false)
      end
    end
    if matches[1] == 'promote' and matches[2] then
      if not is_momod(msg) then
        return
      end
      if not is_owner(msg) then
        return "Only owner can promote"
      end
	local member = matches[2]
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] promoted @".. member)
	local cbres_extra = {
	chat_id = msg.to.id,
        mod_cmd = 'promote', 
	from_id = msg.from.id
	}
	local username = matches[2]
	local username = string.gsub(matches[2], '@', '')
	return res_user(username, promote_demote_res, cbres_extra)
    end
    if matches[1] == 'demote' and not matches[2] then
      if not is_owner(msg) then
        return "Only the owner can demote moderators"
      end
      if type(msg.reply_id)~="nil" then
          msgr = get_message(msg.reply_id, demote_by_reply, false)
      end
    end
    if matches[1] == 'demote' and matches[2] then
      if not is_momod(msg) then
        return
      end
      if not is_owner(msg) then
        return "Only owner can demote"
      end
      if string.gsub(matches[2], "@", "") == msg.from.username and not is_owner(msg) then
        return "You can't demote yourself"
      end
	local member = matches[2]
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] demoted @".. member)
	local cbres_extra = {
	chat_id = msg.to.id,
        mod_cmd = 'demote', 
	from_id = msg.from.id
	}
	local username = matches[2]
	local username = string.gsub(matches[2], '@', '')
	return res_user(username, promote_demote_res, cbres_extra)
    end
    if matches[1] == 'modlist' then
      savelog(msg.to.id, name_log.." ["..msg.from.id.."] requested group modlist")
      return modlist(msg)
    end
    if matches[1] == 'about' then
      savelog(msg.to.id, name_log.." ["..msg.from.id.."] requested group description")
      return get_description(msg, data)
    end
    if matches[1] == 'rules' then
      savelog(msg.to.id, name_log.." ["..msg.from.id.."] requested group rules")
      return get_rules(msg, data)
    end
    if matches[1] == 'set' then
      if matches[2] == 'rules' then
        rules = matches[3]
        local target = msg.to.id
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] has changed group rules to ["..matches[3].."]")
        return set_rulesmod(msg, data, target)
      end
      if matches[2] == 'about' then
        local data = load_data(_config.moderation.data)
        local target = msg.to.id
        local about = matches[3]
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] has changed group description to ["..matches[3].."]")
        return set_descriptionmod(msg, data, target, about)
      end
    end
    if matches[1] == 'lock' then
      local target = msg.to.id
       if matches[2] == 'tag' then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] locked adstag ")
        return lock_group_tag(msg, data, target)
      end
      if matches[2] == 'trash' then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] locked trash ")
        return lock_group_trash(msg, data, target)
      end
      if matches[2] == 'sticker' then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] locked sticker ")
        return lock_group_sticker(msg, data, target)
      end
       if matches[2] == 'film' then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] locked video ")
        return lock_group_video(msg, data, target)
      end
       if matches[2] == 'share' then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] locked share ")
        return lock_group_share(msg, data, target)
      end
      if matches[2] == 'file' then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] locked file ")
        return lock_group_file(msg, data, target)
      end
      if matches[2] == 'image' then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] locked image ")
        return lock_group_ax(msg, data, target)
      end
       if matches[2] == 'chat' then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] locked chat ")
        return lock_group_chat(msg, data, target)
      end
       if matches[2] == 'english' then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] locked english ")
        return lock_group_en(msg, data, target)
      end
      if matches[2] == 'voice' then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] locked audio ")
        return lock_group_audio(msg, data, target)
      end
      if matches[2] == 'chat' then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] locked tag ")
        return lock_group_chat(msg, data, target)
      end
       if matches[2] == 'link' then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] locked adslink ")
        return lock_group_adslink(msg, data, target)
      end
      if matches[2] == 'join' then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] locked join ")
        return lock_group_join(msg, data, target)
      end
      if matches[2] == 'name' then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] locked name ")
        return lock_group_namemod(msg, data, target)
      end
      if matches[2] == 'member' then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] locked member ")
        return lock_group_membermod(msg, data, target)
        end
      if matches[2] == 'flood' then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] locked flood ")
        return lock_group_floodmod(msg, data, target)
      end
      if matches[2] == 'arabic' then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] locked arabic ")
        return lock_group_arabic(msg, data, target)
      end
      if matches[2] == 'bots' then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] locked bots ")
        return lock_group_bots(msg, data, target)
      end
    if matches[2] == 'leave' then
       savelog(msg.to.id, name_log.." ["..msg.from.id.."] locked leaving ")
       return lock_group_leave(msg, data, target)
     end
   end
    if matches[1] == 'unlock' then 
      local target = msg.to.id
      if matches[2] == 'tag' then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] unlocked adstag ")
        return unlock_group_adstag(msg, data, target)
      end
      if matches[2] == 'trash' then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] unlocked trash ")
        return unlock_group_trash(msg, data, target)
      end
       if matches[2] == 'sticker' then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] unlocked sticker ")
        return unlock_group_sticker(msg, data, target)
      end
       if matches[2] == 'file' then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] unlocked files ")
        return unlock_group_gif(msg, data, target)
      end
      if matches[2] == 'share' then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] unlocked share ")
        return unlock_group_share(msg, data, target)
      end
      if matches[2] == 'film' then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] unlocked films ")
        return unlock_group_film(msg, data, target)
      end
       if matches[2] == 'image' then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] unlocked imags ")
        return unlock_group_ax(msg, data, target)
      end
       if matches[2] == 'chat' then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] unlocked chat ")
        return unlock_group_chat(msg, data, target)
      end
       if matches[2] == 'english' then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] unlocked english ")
        return unlock_group_en(msg, data, target)
      end
      if matches[2] == 'link' then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] unlocked adslink ")
        return unlock_group_adslink(msg, data, target)
      end
      if matches[2] == 'voice' then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] unlocked audio ")
        return unlock_group_audio(msg, data, target)
      end
      if matches[2] == 'chat' then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] unlocked chat ")
        return unlock_group_chat(msg, data, target)
      end
      if matches[2] == 'join' then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] unlocked join ")
        return unlock_group_join(msg, data, target)
      end
      if matches[2] == 'name' then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] unlocked name ")
        return unlock_group_namemod(msg, data, target)
      end
      if matches[2] == 'member' then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] unlocked member ")
        return unlock_group_membermod(msg, data, target)
      end
      if matches[2] == 'photo' then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] unlocked photo ")
        return unlock_group_photomod(msg, data, target)
      end
      if matches[2] == 'flood' then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] unlocked flood ")
        return unlock_group_floodmod(msg, data, target)
      end
      if matches[2] == 'arabic' then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] unlocked arabic ")
        return unlock_group_arabic(msg, data, target)
      end
      if matches[2] == 'bots' then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] unlocked bots ")
        return unlock_group_bots(msg, data, target)
      end
    if matches[2] == 'leave' then
       savelog(msg.to.id, name_log.." ["..msg.from.id.."] unlocked leaving ")
       return unlock_group_leave(msg, data, target)
     end
   end
    if matches[1] == 'settings' then
      local target = msg.to.id
      savelog(msg.to.id, name_log.." ["..msg.from.id.."] requested group settings ")
      return show_group_settingsmod(msg, data, target)
    end	

  --[[if matches[1] == 'public' then
    local target = msg.to.id
    if matches[2] == 'yes' then
      savelog(msg.to.id, name_log.." ["..msg.from.id.."] set group to: public")
      return set_public_membermod(msg, data, target)
    end
    if matches[2] == 'no' then
      savelog(msg.to.id, name_log.." ["..msg.from.id.."] set group to: not public")
      return unset_public_membermod(msg, data, target)
    end
  end]]

    if matches[1] == 'newlink' and not is_realm(msg) then
      if not is_momod(msg) then
        return "For moderators only!"
      end
      local function callback (extra , success, result)
        local receiver = 'chat#'..msg.to.id
        if success == 0 then
           return send_large_msg(receiver, '*Error: Invite link failed* \nReason: Not creator.')
        end
        send_large_msg(receiver, "Created a new link")
        data[tostring(msg.to.id)]['settings']['set_link'] = result
        save_data(_config.moderation.data, data)
      end
      local receiver = 'chat#'..msg.to.id
      savelog(msg.to.id, name_log.." ["..msg.from.id.."] revoked group link ")
      return export_chat_link(receiver, callback, true)
    end
    if matches[1] == 'link' then
      if not is_momod(msg) then
        return "For moderators only!"
      end
      local group_link = data[tostring(msg.to.id)]['settings']['set_link']
      if not group_link then 
        return "Create a link using /newlink first !"
      end
       savelog(msg.to.id, name_log.." ["..msg.from.id.."] requested group link ["..group_link.."]")
      return ""..string.gsub(msg.to.print_name, "_", " ").." link :\n"..group_link
    end
    if matches[1] == 'setowner' and matches[2] then
      if not is_owner(msg) then
        return "For owner only!"
      end
      data[tostring(msg.to.id)]['set_owner'] = matches[2]
      save_data(_config.moderation.data, data)
      savelog(msg.to.id, name_log.." ["..msg.from.id.."] set ["..matches[2].."] as owner")
      local text = matches[2].." added as owner"
      return text
    end
    if matches[1] == 'setowner' and not matches[2] then
      if not is_owner(msg) then
        return "only for the owner!"
      end
      if type(msg.reply_id)~="nil" then
          msgr = get_message(msg.reply_id, setowner_by_reply, false)
      end
    end
    if matches[1] == 'owner' then
      local group_owner = data[tostring(msg.to.id)]['set_owner']
      if not group_owner then 
        return "no owner,ask admins in support groups to set owner for your group"
      end
      savelog(msg.to.id, name_log.." ["..msg.from.id.."] used /owner")
      return "Group owner is ["..group_owner..']'
    end
    if matches[1] == 'setgpowner' then
      local receiver = "chat#id"..matches[2]
      if not is_admin(msg) then
        return "For admins only!"
      end
      data[tostring(matches[2])]['set_owner'] = matches[3]
      save_data(_config.moderation.data, data)
      local text = matches[3].." added as owner"
      send_large_msg(receiver, text)
      return
    end
    if matches[1] == 'setflood' then 
      if not is_momod(msg) then
        return "For moderators only!"
      end
      if tonumber(matches[2]) < 0 or tonumber(matches[2]) > 20 then
        return "Wrong number,range is [0-20]"
      end
      local flood_max = matches[2]
      data[tostring(msg.to.id)]['settings']['flood_msg_max'] = flood_max
      save_data(_config.moderation.data, data)
      savelog(msg.to.id, name_log.." ["..msg.from.id.."] set flood to ["..matches[2].."]")
      return 'Group flood has been set to '..matches[2]
    end
    if matches[1] == 'clean' then
      if not is_owner(msg) then
        return "Only owner can clean"
      end
      if matches[2] == 'member' then
        if not is_sudo(msg) then
          return "Only sudo can clean members"
        end
        local receiver = get_receiver(msg)
        chat_info(receiver, cleanmember, {receiver=receiver})
      end
      if matches[2] == 'modlist' then
        if next(data[tostring(msg.to.id)]['moderators']) == nil then --fix way
          return 'No moderator in this group.'
        end
        local message = '\nList of moderators for ' .. string.gsub(msg.to.print_name, '_', ' ') .. ':\n'
        for k,v in pairs(data[tostring(msg.to.id)]['moderators']) do
          data[tostring(msg.to.id)]['moderators'][tostring(k)] = nil
          send_large_msg(get_receiver(msg), "successful!")
          save_data(_config.moderation.data, data)
        end
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] cleaned modlist")
      end
      if matches[2] == 'rules' then 
        local data_cat = 'rules'
        data[tostring(msg.to.id)][data_cat] = nil
        save_data(_config.moderation.data, data)
        send_large_msg(get_receiver(msg), "successful!")
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] cleaned rules")
      end
      if matches[2] == 'about' then 
        local data_cat = 'description'
        data[tostring(msg.to.id)][data_cat] = nil
        save_data(_config.moderation.data, data)
        send_large_msg(get_receiver(msg), "successful!")
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] cleaned about")
      end     
    end
    if matches[1] == 'kill' and matches[2] == 'chat' then
      if not is_admin(msg) then
          return nil
      end
      if not is_realm(msg) then
          local receiver = get_receiver(msg)
          return modrem(msg),
          print("Closing Group..."),
          chat_info(receiver, killchat, {receiver=receiver})
      else
          return 'This is a realm'
      end
   end
    if matches[1] == 'kill' and matches[2] == 'realm' then
     if not is_admin(msg) then
         return nil
     end
     if not is_group(msg) then
        local receiver = get_receiver(msg)
        return realmrem(msg),
        print("Closing Realm..."),
        chat_info(receiver, killrealm, {receiver=receiver})
     else
        return 'This is a group'
     end
   end
    if matches[1] == 'help' then
      if not is_momod(msg) or is_realm(msg) then
        return
      end
      savelog(msg.to.id, name_log.." ["..msg.from.id.."] Used /help")
      return help()
    end
    if matches[1] == 'res' or 'id' then 
      local cbres_extra = {
        chatid = msg.to.id
      }
      local username = matches[2]
      local username = username:gsub("@","")
      savelog(msg.to.id, name_log.." ["..msg.from.id.."] Used /res "..username)
      return res_user(username,  callbackres, cbres_extra)
    end
    if matches[1] == 'kickinactive' then
      send_large_msg('chat#id'..msg.to.id, 'I\'m in matches[1]')
	    if not is_momod(msg) then
	      return 'Only a moderator can kick inactive users'
	    end
	    local num = 1
	    if matches[2] then
	        num = matches[2]
	    end
	    local chat_id = msg.to.id
	    local receiver = get_receiver(msg)
      return kick_inactive(chat_id, num, receiver)
    end
  end 
end

return {
  patterns = {
  "^[!/](add)$",
  "^[!/](add) (realm)$",
  "^[!/](rem)$",
  "^[!/](rem) (realm)$",
  "^[!/](rules)$",
  "^[!/](about)$",
  "^[!/](setname) (.*)$",
  "^[!/](setphoto)$",
  "^[!/](promote) (.*)$",
  "^[!/](promote)",
  "^[!/](help)$",
  "^[!/](clean) (.*)$",
  "^[!/](kill) (chat)$",
  "^[!/](kill) (realm)$",
  "^[!/](demote) (.*)$",
  "^[!/](demote)",
  "^[!/](set) ([^%s]+) (.*)$",
  "^[!/](lock) (.*)$",
  "^[!/](setowner) (%d+)$",
  "^[!/](setowner)",
  "^[!/](owner)$",
  "^[!/](res) (.*)$",
  "^[!/](setgpowner) (%d+) (%d+)$",-- (group id) (owner id)
  "^[!/](unlock) (.*)$",
  "^[!/](setflood) (%d+)$",
  "^[!/](settings)$",
-- "^[!/](public) (.*)$",
  "^[!/](modlist)$",
  "^[!/](newlink)$",
  "^[!/](link)$",
  "^[!/](id) (.*)$",
  "^[!/](kickinactive)$",
  "^[!/](kickinactive) (%d+)$",
  "%[(photo)%]",
  "^!!tgservice (.+)$",
  },
  run = run
}
end


