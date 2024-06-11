class Tag < ApplicationRecord
  has_many :classfield_tags
  has_and_belongs_to_many :classfields, through: :classfield_tags
end
