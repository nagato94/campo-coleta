class ApplicationController < ActionController::API
  def authenticate_request!
    token = request.headers['Authorization']
    if token.present?
      user_id = AuthenticationTokenService.decode(token.split(' ').last)
      @current_user = User.find(user_id)
    else
      render json: { errors: 'Not Authenticated' }, status: :unauthorized
    end
  rescue JWT::DecodeError
    render json: { errors: 'Invalid Token' }, status: :unauthorized
  end
end
