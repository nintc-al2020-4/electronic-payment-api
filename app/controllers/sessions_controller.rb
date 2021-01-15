class SessionsController < ApplicationController
  def create
    return  unless check_required_params [:email, :password]

    user = User.find_by(email: params[:email])

    unless user
      render status: 401, json: {error: "Email or password is wrong."}
      return
    end

    if user.authenticate(params[:password])
      login_session = Session.create!(user: user)
      render status: 200, json: {token: login_session.token}
    else
      render status: 401, json: {error: "Email or password is wrong."}
    end

  end

  def destroy
    return  unless check_required_params [:token]

    login_session = Session.find_by(token: params[:token])
    if login_session
      login_session.destroy!
      head :no_content
    else
      render status: 404, json: {error: "Invalid token"}
    end
  end
end
