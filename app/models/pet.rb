class Pet < ApplicationRecord
  belongs_to :user
  has_one_attached :photo

  # Define pet size options as a constant array
  SIZES = ["Small", "Medium", "Big"]

  # Validation for pet size
  validates :size, inclusion: { in: SIZES, allow_blank: true }
  validates :pet_name, :birthdate, :microchip_number, :breed, :size, :color, presence: true

end
