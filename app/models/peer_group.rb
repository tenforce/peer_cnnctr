class PeerGroup < ActiveRecord::Base
  has_many :peers

  validates_uniqueness_of :key
end
