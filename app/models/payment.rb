class Payment < ApplicationRecord

  def self.charge(product, token, params)
    Stripe::Charge.create(
      :amount => (product.price * 100).to_i, # amount in cents, again
      :currency => "eur",
      :source => token,
      :description => params[:stripeEmail]
    )
  end

  def self.create_order(product)
    Order.create(
      :product_id => @product_id,
      :user_id => @user_id,
      :total => product.price)
  end

end
