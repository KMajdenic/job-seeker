class Review < ApplicationRecord
  belongs_to :user
  belongs_to :classfield
  belongs_to :application

  enum rating: {not_reviewed: 0, positive_review: 1, negative_review: -1}
  enum review_type: { poster_review: 0, applicant_review: 1 }

  validates :rating, presence: true
  validates :note, presence: true
  validates :classfield, presence: true
end
