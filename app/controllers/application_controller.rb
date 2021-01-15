class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods

  before_action :authenticate

  protected

  def authenticate_token
    authenticate_with_http_token do |token, options|
      session = Session.find_by(token: token)

      @user = session.user if session

      session
    end
  end

  def render_unauthorized
    render status: :unauthorized, json: {error: "Invalid token"}
  end

  private

  def authenticate
    authenticate_token || render_unauthorized
  end

  def check_required_params(required_keys)
    required_keys.each do |key|
      unless params[key]
        render status: :bad_request, json: {error: "Invalid format"}
        return false
      end
    end

    true
  end

end
