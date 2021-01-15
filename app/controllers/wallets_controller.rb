class WalletsController < ApplicationController
  def show
    wallet = @user.wallet

    render json: {balance: wallet.balance}
  end
end
