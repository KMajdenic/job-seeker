class UserClassfield < ApplicationRecord
  belongs_to :user
  belongs_to :classfield

  enum status: { pending: "pending", accepted: "accepted", rejected: "rejected" }

  validates :status, inclusion: {in: statuses.keys}
end
