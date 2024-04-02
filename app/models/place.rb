class Place < ApplicationRecord
  has_many :lists
  has_many :reviews
end
