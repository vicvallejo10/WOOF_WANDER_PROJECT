class List < ApplicationRecord
  belongs_to :user
  has_many :place, through: :list_place
  has_many :list_place
end
