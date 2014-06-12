class AddSharedContactUrlToPeers < ActiveRecord::Migration
  def change
    add_column :peers, :shared_contact_url, :string
  end
end
