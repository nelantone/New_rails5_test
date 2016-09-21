class PaymentsController < ApplicationController
  def create
    product = Product.find(params[:product_id])
    # @user = current_user
    token = params[:stripeToken]
    # Create the charge on Stripe's servers - this will charge the user's card
    begin

    if Payment.charge(product, token, params).paid
      Payment.create_order(product)
    end

    flash[:success] = "Payment processed successfully"

    rescue Stripe::CardError => e
      # The card has been declined
            body = e.json_body
      err = body[:error]
      flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
    end

    # UserMailer.create(@user, charge ).deliver_now
  end
end
