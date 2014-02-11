class CreatePeers < ActiveRecord::Migration
  def change
    create_table :peers do |t|
      t.string :contact_point
      t.references :peer_group, index: true

      t.timestamps
    end
  end
end
