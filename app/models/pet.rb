class Pet < ApplicationRecord
  belongs_to :user
  has_many_attached :photos

  # Define pet size options as a constant array
  SIZES = ["Small", "Medium", "Big"]

  # Validation for pet size
  validates :size, inclusion: { in: SIZES, allow_blank: true }
end
