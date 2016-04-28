do
    local function run(msg, matches)
    local support = '138776903' -- آیدی ساپورت بات رو اینجا قرار دهید
    local data = load_data(_config.moderation.data)
    local name_log = user_print_name(msg.from)
        if matches[1] == 'support' then
        local group_link = data[tostring(support)]['settings']['set_link']
    return "Support Group link:\n"..group_link
    end
end
return {
    patterns = {
    "^[!/#](support)$",
     },
    run = run
}
end
