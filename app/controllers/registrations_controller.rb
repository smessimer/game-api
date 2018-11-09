class RegistrationsController < Devise::RegistrationsController
  skip_before_action :verify_authenticity_token
  respond_to :json

  def create
    resource = User.new(sign_up_params)
    if resource.save
      render :json => resource
    else
      render :json => { success: false }
    end
  end

  def sign_up_params
    params.permit(:email, :password)
  end
end