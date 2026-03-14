class Neighborhood < ApplicationRecord
  has_many :breweries, dependent: :nullify
  has_one_attached :map_light
  has_one_attached :map_dark

  scope :ordered, -> { order(:position) }
end
