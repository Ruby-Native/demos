class OrderItemExtra < ApplicationRecord
  belongs_to :order_item

  def display_price
    "+$#{"%.2f" % (price / 100.0)}"
  end
end
