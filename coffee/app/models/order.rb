class Order < ApplicationRecord
  include ActionView::RecordIdentifier

  belongs_to :user
  has_many :order_items, dependent: :destroy

  after_update_commit :broadcast_status, if: :saved_change_to_status?

  enum :status, {cart: "cart", placed: "placed", preparing: "preparing", ready: "ready", completed: "completed"}

  scope :active, -> { where(status: [:placed, :preparing, :ready]) }
  scope :past, -> { where(status: :completed) }

  def active?
    placed? || preparing? || ready?
  end

  def recalculate_total!
    update!(total: order_items.sum { |item| item.line_total })
  end

  def display_total
    "$#{"%.2f" % (total / 100.0)}"
  end

  def status_label
    case status
    when "cart" then "In cart"
    when "placed" then "Placed"
    when "preparing" then "Preparing"
    when "ready" then "Ready for pickup"
    when "completed" then "Completed"
    end
  end

  def status_color
    case status
    when "placed" then "bg-blue-100 text-blue-800 dark:bg-blue-900/30 dark:text-blue-300"
    when "preparing" then "bg-yellow-100 text-yellow-800 dark:bg-yellow-900/30 dark:text-yellow-300"
    when "ready" then "bg-green-100 text-green-800 dark:bg-green-900/30 dark:text-green-300"
    when "completed" then "bg-coffee-100 text-coffee-600 dark:bg-coffee-800 dark:text-coffee-300"
    else "bg-coffee-100 text-coffee-600 dark:bg-coffee-800 dark:text-coffee-300"
    end
  end

  private

  def broadcast_status
    broadcast_replace_to(
      "order_#{id}",
      target: dom_id(self, :status),
      partial: "orders/status",
      locals: {order: self}
    )
  end
end
