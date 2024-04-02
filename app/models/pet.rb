class Pet < ApplicationRecord
  belongs_to :user

  # Define pet size options as a constant array
  PET_SIZES = ["Small", "Medium", "Large"].freeze

  # Validation for pet size
  validates :pet_size, inclusion: { in: PET_SIZES, allow_blank: true }
end
