class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product
  has_many :order_item_extras, dependent: :destroy

  enum :size, {small: "small", medium: "medium", large: "large"}

  def line_total
    (unit_price * quantity) + order_item_extras.sum(:price)
  end

  def display_line_total
    "$#{"%.2f" % (line_total / 100.0)}"
  end

  def display_unit_price
    "$#{"%.2f" % (unit_price / 100.0)}"
  end

  def customization_summary
    parts = [size.capitalize]
    parts << milk if milk.present?
    parts += order_item_extras.pluck(:name)
    parts.join(", ")
  end
end
