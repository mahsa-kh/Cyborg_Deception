class AddMacvlanNameToNetworks < ActiveRecord::Migration[6.0]
  def change
    add_column :networks, :macvlan_name, :text
  end
end
