class Review < ApplicationRecord
  belongs_to :user
  belongs_to :place
  validates :rating, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :title,:description, presence: true # Add validation for content attribute
end
