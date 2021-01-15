class WalletsController < ApplicationController
  def show
    user = load_user
    return  unless user

    wallet = user.wallet

    render json: {balance: wallet.balance}
  end
end
