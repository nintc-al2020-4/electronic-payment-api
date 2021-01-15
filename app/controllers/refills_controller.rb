class RefillsController < ApplicationController
  def create
    return  unless check_required_params [:amount]

    @user.wallet.refills.create!(amount: params[:amount])
  end
end
