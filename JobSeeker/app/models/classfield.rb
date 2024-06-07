class Classfield < ApplicationRecord
  #AVALIABLE_TAGS=["Kućanstvo", "IT", "Građevinarstvo"]
  belongs_to :user
  belongs_to :category
  has_many :user_classfields
  has_many :applicants, through: :user_classfields, source: :user
  has_and_belongs_to_many :tags
  validates :user, presence: true

  enum status: { draft: 0, published: 1, archived: 2 }
  #serialize :tags, coder: Array
end
