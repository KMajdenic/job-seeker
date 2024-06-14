class Classfield < ApplicationRecord
  #AVALIABLE_TAGS=["Kućanstvo", "IT", "Građevinarstvo"]
  belongs_to :user
  belongs_to :category
  has_many :applications
  has_many :applicants, through: :applications, source: :user
  has_many :classfield_tags
  has_many :tags, through: :classfield_tags
  has_many :reviews, through: :applications
  validates :user, presence: true

  enum status: { draft: 0, published: 1, archived: 2 }
end
