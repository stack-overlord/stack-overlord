json.array!(@hashed_macs) do |hashed_mac|
  json.extract! hashed_mac, :id
  json.url hashed_mac_url(hashed_mac, format: :json)
end
