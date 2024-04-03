class Place < ApplicationRecord
  PROPERTY_TYPES = ["Restaurant", "Park", "Beach", "Lake", "Garden", "Museum", "Library", "Hotel", "Cafe", "Accommodation", "Store", "Workspace", "Hiking Area/Trail", "Event/Activity", "Veterinary Clinic", "Veterinary Hospital", "Grooming Station", "Pet Store"].freeze

  SPECIAL_CHARACTERISTICS = ["Offleash", "Indoor", "Outdoor", "Disposal Station", "Water Access"].freeze

  # Validation for property type
  validates :property_type, inclusion: { in: PROPERTY_TYPES, allow_blank: true }

  # Associations
  has_many :lists
  has_many :reviews

  # Validation for special characteristics
  validates :tag_offleash, inclusion: { in: [true, false] }
  validates :tag_indoor, inclusion: { in: [true, false] }
  validates :tag_outdoor, inclusion: { in: [true, false] }
  validates :tag_disposalstation, inclusion: { in: [true, false] }
  validates :tag_wateraccess, inclusion: { in: [true, false] }

  # Geocoding to get information from address
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
