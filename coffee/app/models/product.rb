class Product < ApplicationRecord
  belongs_to :category

  default_scope { order(:position) }

  SIZE_ADJUSTMENTS = {"small" => -50, "medium" => 0, "large" => 70}.freeze

  def price_for_size(size)
    base_price + SIZE_ADJUSTMENTS.fetch(size.to_s, 0)
  end

  def display_price
    "$#{"%.2f" % (base_price / 100.0)}"
  end
end
