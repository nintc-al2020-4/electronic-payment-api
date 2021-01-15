class SessionsController < ApplicationController
  def create
    if params[:email].nil? || params[:password].nil?
      render status: 400, json: {error: "Format is Wrong."}
      return
    end

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
    unless params[:token]
      render status: 400, json: {error: "Format is Wrong."}
      return
    end

    login_session = Session.find_by(token: params[:token])
    if login_session
      login_session.destroy!
      head :no_content
    else
      head :bad_request
    end
  end
end
