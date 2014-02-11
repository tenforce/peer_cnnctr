class PeerGroup < ActiveRecord::Base
  extend FriendlyId
  friendly_id :key

  has_many :peers

  validates_uniqueness_of :key
  validates_format_of :key, with: /\A[A-Z0-9\-]+\z/i

  def to_s
    key
  end
end
