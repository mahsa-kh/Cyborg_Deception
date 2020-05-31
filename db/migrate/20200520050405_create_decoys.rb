class CreateDecoys < ActiveRecord::Migration[6.0]
  def change
    create_table :decoys do |t|
      t.text :name
      t.text :description
      t.text :ip
      t.integer :config
      t.references :network, null: false, foreign_key: true
      t.references :decoy_template, null: false, foreign_key: true

      t.timestamps
    end
    add_index :decoys, :config, unique: true
  end
end
