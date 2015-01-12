class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Part 1: Addin a name attribute to the Devise User model
  before_action :configure_devise_permitted_parameters, if: :devise_controller?

  private
  # Overwriting the sign_out redirect path method / Devise
  def after_sign_out_path_for(user)
    root_path
  end

  # Part 2: Adding a name attribute to the Devise User model
  protected
  def configure_devise_permitted_parameters
    registration_params = [:name, :email, :password, :password_confirmation]

    if params[:action] == 'update'
      devise_parameter_sanitizer.for(:account_update) { 
        |u| u.permit(registration_params << :current_password)
      }
    elsif params[:action] == 'create'
      devise_parameter_sanitizer.for(:sign_up) { 
        |u| u.permit(registration_params) 
      }
    end
  end

end
