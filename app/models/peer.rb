# -*- coding: utf-8 -*-
class Peer < ActiveRecord::Base
  extend FriendlyId
  friendly_id :shared_contact_url

  belongs_to :peer_group

  validates_presence_of :peer_group
  before_create :delete_peers_with_same_name
  after_create :notify_peers_we_joined
  after_destroy :notify_peers_we_left

  # Retrieves all piers which aren't me
  def peers
    peer_group.peers.without self
  end

  # Retrieves all peers from a fresh relationship
  def fresh_peers
    peer_group.peers.reload.without self
  end

  def to_param
    Rack::Utils.escape contact_point
  end

protected

  # Retrieves the contact point as a URI object
  def contact_point_uri
    URI( contact_point )
  end

  # Notify all our peers that we have joined
  def notify_peers_we_joined
    peers.each do |other|
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
    peers.each do |other|
      Spawnling.new do
        begin
          res = Net::HTTP.post_form(other.contact_point_uri, left: shared_contact_url)
          assert res.is_a? Net::HTTPSuccess
        rescue
          other.destroy!
        end
      end
    end
  end

  # If a peer has the same name as us, it means we have disconnected and are
  # reconnecting.  We delete (but not destroy), the peers with the same name.
  # This ensures the callbacks aren't called to deregister ourselves from our
  # peers, but it does allow us to reintroduce ourselves soon after.
  def delete_peers_with_same_name
    Peer.find_all_by_contact_point( self.contact_point ).each do |peer| peer.delete end
  end

  def assert( condition )
    unless condition
      raise "#{condition} is not true!"
    end
  end

end
