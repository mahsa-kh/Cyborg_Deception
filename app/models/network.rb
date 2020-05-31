class Network < ApplicationRecord
  belongs_to :user
  has_many :decoys, dependent: :destroy
  has_many :decoy_templates, through: :decoys

end
