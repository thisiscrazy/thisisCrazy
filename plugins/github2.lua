do
local function run(msg, matches)
 if matches[2] == 'repo' then
  url = "https://api.github.com/repos/"..matches[3]
  https.request(url)
  jdat = JSON.decode(jstr) 
  if jdat.message then
  return jdat.message
  else
     text = jdat.owner.login..' / '..jdat.name
  if jdat.description then
  text = text..'\n______________________________\n'..jdat.description
  end
  text = text..'\n______________________________\nLanguage: '..jdat.language
  ..'\nForks: '..jdat.forks_count
  ..'\nIssues: '..jdat.open_issues
  ..'\nRepo URL: '..jdat.html_url
  local file = download_to_file(jdat.owner.avatar_url,'Sbss.webp')
  send_document('chat#id'..msg.to.id,file,ok_cb,false)
  return text
end
end
end
local function run(msg, matches)
if matches[1]:lower() == 'git' then 
 if matches[2] == 'repo' then
  url = "https://api.github.com/repos/"..matches[3]
  https.request(url)
  jdat = JSON.decode(jstr) 
  if jdat.message then
  return jdat.message
  else
     text = jdat.owner.login..' / '..jdat.name
  if jdat.description then
  text = text..'\n______________________________\n'..jdat.description
  end
  text = text..'\n______________________________\nLanguage: '..jdat.language
  ..'\nForks: '..jdat.forks_count
  ..'\nIssues: '..jdat.open_issues
  ..'\nRepo URL: '..jdat.html_url
  local file = download_to_file(jdat.owner.avatar_url,'Sbss.webp')
  send_document('chat#id'..msg.to.id,file,ok_cb,false)
  return text
end
end
if matches[2] == 'user' then
  local eq = URL.escape(matches[3])
     url = "https://api.github.com/users/"..eq
     jstr, res = https.request(url)
     jdat = JSON.decode(jstr)
  if jdat.message then
  return jdat.message
  else
     text = jdat.login..'\nFollowers: '..jdat.followers..'\nFollowings: '..jdat.following..'\nRepos: '..jdat.public_repos..'\nProfile URL: '..jdat.html_url
  local file = download_to_file(jdat.avatar_url,'Sbss.webp')
  send_document('chat#id'..msg.to.id,file,ok_cb,false)
  return text
end
end
if matches[2] == 'down' then
local url = 'https://codeload.github.com/'..matches[3]..'/zip/master'
  local receiver = get_receiver(msg)
  send_document_from_url(receiver, url, {receiver, title})
end
end
end
return {
  patterns = {
    "^[/!#](git)(.*) (.*)",
    "^([Gg]it)(.*) (.*)",
  },
  run = run
}
end
