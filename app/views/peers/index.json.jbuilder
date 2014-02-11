json.array!(@peers) do |peer|
  json.extract! peer, :id, :contact_point, :peer_group_id
  json.url peer_groups_peer_url(@peer_group, peer, format: :json)
end
