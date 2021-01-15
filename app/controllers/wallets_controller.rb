class WalletsController < ApplicationController
  def show
    return  unless @user

    wallet = @user.wallet

    render json: {balance: wallet.balance}
  end
end
