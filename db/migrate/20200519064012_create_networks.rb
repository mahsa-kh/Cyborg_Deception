class CreateNetworks < ActiveRecord::Migration[6.0]
  def change
    create_table :networks do |t|
      t.text :name
      t.text :vlan
      t.text :description
      t.text :subnet
      t.text :gateway
      t.integer :assets
      t.integer :decoys
      t.integer :os
      t.integer :service

      t.timestamps
    end
  end
end
