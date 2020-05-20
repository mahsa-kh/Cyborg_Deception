class CreateNetworks < ActiveRecord::Migration[6.0]
  def change
    create_table :networks do |t|
      t.string :name
      t.string :description
      t.text :vlan
      t.text :subnet
      t.text :gateway
      t.integer :asset
      t.references :user, index: true
      t.timestamps null: false
    end
  end
end
