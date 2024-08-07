module Api
  module V1
    class AuthenticationController < ApplicationController
      def login
        @user = User.find_by(email: params[:email])

        if @user&.authenticate(params[:password])
          token = AuthenticationTokenService.encode(@user.id)
          render json: { token: token }, status: :ok
        else
          render json: { error: 'Invalid email or password' }, status: :unauthorized
        end
      end
    end
  end
end
