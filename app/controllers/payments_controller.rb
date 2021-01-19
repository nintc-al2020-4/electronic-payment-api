class PaymentsController < ApplicationController
  skip_before_action :authenticate, only: [:create]

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

  def index
    limit = params[:limit] || 10
    payments = @user.wallet.payments.order(created_at: :desc).limit(limit)

    response = []
    payments.each do |payment|
      json = {amount: payment.amount, time: payment.created_at.getlocal("+09:00").strftime("%FT%T%:z")}
      response << json
    end

    render json: response
  end
end
