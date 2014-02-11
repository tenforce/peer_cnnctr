class CreatePeerGroups < ActiveRecord::Migration
  def change
    create_table :peer_groups do |t|
      t.string :key

      t.timestamps
    end
  end
end
