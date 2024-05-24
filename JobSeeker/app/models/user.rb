class User < ApplicationRecord
  has_many :classfields, dependent: :destroy
  has_many :user_classfields
  has_many :applied_classfields, through: :user_classfields, source: :classfield
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
