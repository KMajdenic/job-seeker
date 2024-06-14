class Application < ApplicationRecord
  belongs_to :user
  belongs_to :classfield
  has_one :review

  enum status: { pending: "pending", accepted: "accepted", rejected: "rejected" }

  validates :status, inclusion: {in: statuses.keys}
end
