class SessionsController < Devise::SessionsController
  respond_to :json

  # GET /login
  def new
    head :no_content
  end

  # POST /login
  def create
    user = User.find_by(email: login_params[:email])
    if user.present? && user.valid_password?(login_params[:password])
      sign_in user
      session = { token: current_token }
      json_response(session)
    else
      error = 'Invalid email or password'
      json_response(error, 422)
    end
  end

  private

  def respond_to_on_destroy
    head :no_content
  end

  def current_token
    request.env['warden-jwt_auth.token']
  end

  def login_params
    params.require(:user).permit(:email, :password)
  end
end
