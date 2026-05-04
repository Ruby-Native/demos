RubyNative.configure do |c|
  c.screenshot_key = "02134f3ac08b1b9fd3ca1a27851283995182efd2091a04b2ae47fc50c01133c5"
  c.screenshot_sign_in = ->(controller) {
    user = User.find_by!(email: "demo@beervana.test")
    # Mirrors Authentication#sign_in (cookies.permanent.encrypted[:user_id]).
    controller.send(:cookies).permanent.encrypted[:user_id] = user.id
  }
end

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
