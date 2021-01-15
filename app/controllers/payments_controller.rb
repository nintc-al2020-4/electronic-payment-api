class PaymentsController < ApplicationController
  def create
    return  unless check_required_params [:amount]

    begin
      @user.wallet.payments.create!(amount: params[:amount])
    rescue ArgumentError, ActiveRecord::RecordInvalid => e
      render status: :bad_request, json: {error: e.message}
    end

  end
end
