class ApplicationController < ActionController::API

  private

  def load_user
    return false  unless check_required_params :token

    login_session = Session.find_by(token: params[:token])

    if login_session
      login_session.user
    else
      render status: 401, json: {error: "Invalid token"}
      false
    end
  end

  def check_required_params(required_keys)
    required_keys.each do |key|
      unless params[key]
        render status: 400, json: {error: "Invalid format"}
        return false
      end
    end

    true
  end

end
