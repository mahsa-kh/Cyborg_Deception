class CreateDecoyTemplates < ActiveRecord::Migration[6.0]
  def change
    create_table :decoy_templates do |t|
      t.text :name
      t.text :template
      t.text :description
      t.text :service
      t.text :os

      t.timestamps
    end
  end
end
