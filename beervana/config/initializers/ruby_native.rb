RubyNative.on_subscription_change do |event|
  user = User.find_by(id: event.owner_token)
  next unless user

  subscription = user.subscription || user.build_subscription
  attrs = {
    product_id: event.product_id,
    original_transaction_id: event.original_transaction_id,
    status: event.status
  }
  attrs[:expires_at] = event.expires_date if event.expires_date
  subscription.update!(attrs)
end
