class Pet < ApplicationRecord
  belongs_to :user

  # Define pet size options as a constant array
  SIZES = ["Small", "Medium", "Big"]

  # Validation for pet size
  validates :size, inclusion: { in: SIZES, allow_blank: true }
end
