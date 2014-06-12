json.array!(@peers) do |peer|
  json.extract! peer, :id, :contact_point, :peer_group_id, :shared_contact_url
  json.url peer_group_peer_url(@peer_group, peer, format: :json)
end
