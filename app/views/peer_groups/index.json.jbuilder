json.array!(@peer_groups) do |peer_group|
  json.extract! peer_group, :id, :key
  json.url peer_group_url(peer_group, format: :json)
end
