class PagesController < ApplicationController
  def home
    # The following is an alternative to the redirect after signin in application controller
    redirect_to formroutes_path if user_signed_in?
  end
  
  # Allowing custom devise login from this route
  private
 
  def resource_name
    :user
  end
  helper_method :resource_name
 
  def resource
    @resource ||= User.new
  end
  helper_method :resource
 
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
  helper_method :devise_mapping
 
  def resource_class
    User
  end
  helper_method :resource_class
end
