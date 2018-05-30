class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :mailbox, :conversation 

  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def mailbox
    @mailbox ||= current_user.mailbox
  end 

  def conversation

    @conversation ||= mailbox.conversations.find(params[:id])
  end






  
  protected

 def configure_permitted_parameters

    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :email, :password, :remember_me)}
    devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:username,:email, :password, :remember_me)}
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:username, :email, :password, :currentpassword, :remember_me)}



  end
end