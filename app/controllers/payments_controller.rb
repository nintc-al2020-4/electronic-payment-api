class PaymentsController < ApplicationController
  def create
    return  unless check_required_params [:amount, :token]

    begin
      token = PaymentToken.find_by!(token: params[:token])
      wallet = token.wallet

      token.destroy!
      wallet.payments.create!(amount: params[:amount])
    rescue ActiveRecord::RecordNotFound => e
      render status: :not_found, json: {error: "Invalid token"}
    rescue ArgumentError, ActiveRecord::RecordInvalid => e
      render status: :bad_request, json: {error: e.message}
    end

  end
end
