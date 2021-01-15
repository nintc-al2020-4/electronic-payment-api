class PaymentTokensController < ApplicationController
  def show
    token = @user.wallet.payment_tokens.create!

    render json: {token: token.token}
  end
end
