class ApplicationController < ActionController::API
    before_action :authenticate_user!
  
    private
  
    def authenticate_user!
      token = request.headers['Authorization']
      payload = Authentication.decode(token)
  
      if payload
        @current_user = User.find(payload['user_id'])
      else
        render json: { error: 'Invalid or expired token' }, status: :unauthorized
      end
    end
  
    def current_user
      @current_user
    end
  end
  
