class SessionsController < ApplicationController
    def create
      user = User.authenticate(params[:name], params[:password])
      if user
        token = Authentication.encode(user_id: user.id)
        render json: { token: token }
      else
        render json: { error: 'Invalid username or password' }, status: :unauthorized
      end
    end
  end
  