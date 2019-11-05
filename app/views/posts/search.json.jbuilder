json.array! @search do |search|
  json.id search.id
  json.created_at search.created_at
  json.photo search.photo.url
  json.name search.name
  json.date search.date
  json.location search.location
  json.description search.description
  json.nickname search.user.nickname
  json.current_user current_user
end