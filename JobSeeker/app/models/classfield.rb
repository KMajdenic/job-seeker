class Classfield < ApplicationRecord
  #AVALIABLE_TAGS=["Kućanstvo", "IT", "Građevinarstvo"]
  belongs_to :user
  belongs_to :category
  validates :user, presence: true

  enum status: { draft: 0, published: 1, archived: 2 }
  #serialize :tags, coder: Array
end
