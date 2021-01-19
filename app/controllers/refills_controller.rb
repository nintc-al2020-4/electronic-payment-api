class RefillsController < ApplicationController
  def create
    return  unless check_required_params [:amount]

    begin
      @user.wallet.refills.create!(amount: params[:amount])
    rescue ArgumentError, ActiveRecord::RecordInvalid => e
      render status: :bad_request, json: {error: e.message}
    end
  end

  def index
    limit = params[:limit] || 10
    refills = @user.wallet.refills.order(created_at: :desc).limit(limit)

    response = []
    refills.each do |refill|
      json = {amount: refill.amount, time: refill.created_at.getlocal("+09:00").strftime("%FT%T%:z")}
      response << json
    end

    render json: response
  end
end
