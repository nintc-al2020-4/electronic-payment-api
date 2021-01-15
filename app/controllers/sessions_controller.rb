class SessionsController < ApplicationController
  skip_before_action :authenticate, only: [:create]

  def create
    return  unless check_required_params [:email, :password]

    user = User.find_by(email: params[:email])

    unless user
      render status: :unauthorized, json: {error: "Email or password is wrong."}
      return
    end

    if user.authenticate(params[:password])
      login_session = Session.create!(user: user)
      render json: {token: login_session.token}
    else
      render status: :unauthorized, json: {error: "Email or password is wrong."}
    end

  end

  def destroy
    return  unless @user

    authenticate_token.destroy!
  end
end
