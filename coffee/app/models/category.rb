class Category < ApplicationRecord
  has_many :products, -> { order(:position) }, dependent: :destroy

  default_scope { order(:position) }
end
