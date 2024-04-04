class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :pets
  has_many :lists
  has_many :reviews
  def has_reviewed?(place)
    reviews.exists?(place_id: place.id)
  end
end
