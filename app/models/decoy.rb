class Decoy < ApplicationRecord
  belongs_to :network
  belongs_to :decoy_template
  validates :config, uniqueness: true
end
