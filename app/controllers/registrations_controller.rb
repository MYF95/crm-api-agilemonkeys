class RegistrationsController < Devise::RegistrationsController
  respond_to :json

  # POST /signup
  def create
    build_resource(sign_up_params)
    if resource.save
      json_response(resource)
    else
      json_response(resource.errors.messages, 422)
    end
  end

  private

  def sign_up_params
    params.require(:user).permit(:email, :password)
  end
end
