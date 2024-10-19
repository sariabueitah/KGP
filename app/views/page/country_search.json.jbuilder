json.array! @countries do |country|
  json.name country[:name]
  json.flag country[:flag]
end
