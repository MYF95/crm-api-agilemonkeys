class SessionsController < Devise::SessionsController
  respond_to :json

  # TODO include error handling from devise into ErrorHandler module
  def create
    user = User.find_by(email: login_params[:email])
    if user.present? && user.valid_password?(login_params[:password])
      sign_in user
      session = { user: user, token: current_token}
      json_response(session)
    else
      errors = { errors: 'Invalid email or password'}
      json_response(errors, 422)
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
