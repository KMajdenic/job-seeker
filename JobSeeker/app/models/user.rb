class User < ApplicationRecord
  has_many :classfields, dependent: :destroy
  has_many :applications
  has_many :applied_classfields, through: :applications, source: :classfield
  has_many :posted_reviews, class_name: "Review", foreign_key: "user_id"
  has_many :recieved_reviews, through: :applications, source: :review
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  def review_calculation(rating)
    return "No ratings" if recieved_reviews.count == 0
    (recieved_reviews.where(rating: rating).count.to_f / recieved_reviews.count * 100).round(2)
  end

  def positive_reccomendation_rating
    review_calculation(:positive_review)
  end

  def negative_reccomendation_rating
    review_calculation(:negative_review)
  end

  def unrated_rating
    review_calculation(:not_reviewed)
  end

end
