local function save_filter(msg, name, value)
	local hash = nil
	if msg.to.type == 'chat' then
		hash = 'chat:'..msg.to.id..':filters'
	end
	if msg.to.type == 'user' then
		return nil
	end
	if hash then
		redis:hset(hash, name, value)
	return "Word blocked on "  ..string.gsub(msg.to.print_name, "_", " ")
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
		local text = "Filterlist for "  ..string.gsub(msg.to.print_name, "_", " ").." \n===========================\n"
		for i=1, #names do
			text = text..'> '..names[i]..'\n'
		end
		return text
	end
end

local function get_filter(msg, var_name)
	local hash = get_filter_hash(msg)
	if hash then
		local value = redis:hget(hash, var_name)
		if value == 'msg' then
			return 'This word is block in this chat.'
		elseif value == 'kick' then
			send_large_msg('chat#id'..msg.to.id, "you useged block word.bye bye")
			chat_del_user('chat#id'..msg.to.id, 'user#id'..msg.from.id, ok_cb, true)
		end
	end
end

local function get_filter_act(msg, var_name)
	local hash = get_filter_hash(msg)
	if hash then
		local value = redis:hget(hash, var_name)
		if value == 'msg' then
			return 'danger!'
		elseif value == 'kick' then
			return 'kick!'
		elseif value == 'none' then
			return 'not block this word!'
		end
	end
end

local function run(msg, matches)
	local data = load_data(_config.moderation.data)
	if matches[1] == "ilterlist" then
		return list_filter(msg)
	elseif matches[1] == "ilter" and matches[2] == ">" then
		if data[tostring(msg.to.id)] then
			local settings = data[tostring(msg.to.id)]['settings']
			if is_momod(msg) then
				return "Only moderators can do it!"
			else
				local value = 'msg'
				local name = string.sub(matches[3]:lower(), 1, 1000)
				local text = save_filter(msg, name, value)
				return text
			end
		end
	elseif matches[1] == "ilter" and matches[2] == "+" then
		if data[tostring(msg.to.id)] then
			local settings = data[tostring(msg.to.id)]['settings']
			if not is_momod(msg) then
				return "Only moderators can do it!"
			else
				local value = 'kick'
				local name = string.sub(matches[3]:lower(), 1, 1000)
				local text = save_filter(msg, name, value)
				return text
			end
		end
	elseif matches[1] == "ilter" and matches[2] == "-" then
		if data[tostring(msg.to.id)] then
			local settings = data[tostring(msg.to.id)]['settings']
			if not is_momod(msg) then
				return "Only moderators can do it!"
			else
				local value = 'none'
				local name = string.sub(matches[3]:lower(), 1, 1000)
				local text = save_filter(msg, name, value)
				return text
			end
		end
	elseif matches[1] == "ilter" and matches[2] == "?" then
		return get_filter_act(msg, matches[3]:lower())
	else
		if is_sudo(msg) then
			return
		elseif is_admin(msg) then
			return
		elseif is_momod(msg) then
			return
		elseif tonumber(msg.from.id) == tonumber(our_id) then
			return
		else
			return get_filter(msg, msg.text:lower())
		end
	end
end

return {
	description = "Set and Get Variables", 
	usagehtm = '<tr><td align="center">filter > </td><td align="right"></td></tr>'
	..'<tr><td align="center">filter + </td><td align="right"></td></tr>'
	..'<tr><td align="center">filter - </td><td align="right">'
	..'<tr><td align="center">filter ? </td><td align="right"></td></tr>',
	usage = {
	user = {
		"filter ? (word) : ",
		"filterlist : ",
	},
	moderator = {
		"filter > (word) : ",
		"filter + (word) : ",
		"filter - (word) : ",
	},
	},
	patterns = {
		"^[Ff](ilter) (.+) (.*)$",
		"^[Ff](ilterlist)$",
		"(.*)",
	},
	run = run
}
