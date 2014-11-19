json.array!(@gawks) do |gawk|
  json.extract! gawk, :id
  json.url gawk_url(gawk, format: :json)
end
