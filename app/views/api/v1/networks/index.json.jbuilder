json.array! @networks do |network|
  json.extract! network, :vlan, :name, :description, :subnet, :gateway, :assets, :decoys, :os, :service
end

