# app/models/place.rb

class Place < ApplicationRecord
  # Define property types as constants
  PROPERTY_TYPES = ["Restaurant", "Park", "Beach", "Lake", "Garden", "Museum", "Library", "Hotel", "Cafe", "Accommodation", "Store", "Workspace", "Hiking Area/Trail", "Event/Activity", "Veterinary Clinic", "Veterinary Hospital", "Grooming Station", "Pet Store"].freeze

  # Validation for property type
  validates :property_type, inclusion: { in: PROPERTY_TYPES, allow_blank: true }

  # Associations
  has_many :lists
  has_many :reviews
end
