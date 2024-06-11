class User < ApplicationRecord
  has_many :classfields, dependent: :destroy
  has_many :applications
  has_many :applied_classfields, through: :applications, source: :classfield
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
