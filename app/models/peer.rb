class Peer < ActiveRecord::Base
  belongs_to :peer_group

  around_create :notify_peers_we_joined
  around_destroy :notify_peers_we_left

  # Retrieves all piers which aren't me
  def peers
    peer_group.peers.reject { |item| item.id == id }
  end

protected

  # Retrieves the contact point as a URI object
  def contact_point_uri
    URI( contact_point )
  end

  # Notify all our peers that we have joined
  def notify_peers_we_joined
    others = peers
    yield
    others.each do |other|
      Spawnling.new do
        begin
          res = Net::HTTP.post_form(other.contact_point_uri, joined: shared_contact_url)
          assert res.is_a? Net::HTTPSuccess
        rescue
          other.destroy!
        end
      end
    end
  end

  # Notify all peers that we have left the group
  def notify_peers_we_left
    others = peers
    yield
    others.each do |other|
      Spawnling.new do
        begin
          res = Net::HTTP.post_form(other.contact_point_uri, left: contact_point)
          assert res.is_a? Net::HTTPSuccess
        rescue
          other.destroy!
        end
      end
    end
  end

  def assert( condition )
    unless condition
      raise "#{condition} is not true!"
    end
  end

end
