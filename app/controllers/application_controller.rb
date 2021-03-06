class ApplicationController < ActionController::Base
  protect_from_forgery
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  include Pundit


  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  def configure_permitted_parameters

   # devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name], :account_update, keys: [:username], :first_name, :last_name, address_attributes: [:country, :state, :city, :area, :postal_code]])
   devise_parameter_sanitizer.permit(:sign_up, keys: [:photo, :photo_cache, :first_name, :last_name, address_attributes: [:country, :state, :city, :area, :postal_code]])
   devise_parameter_sanitizer.permit(:account_update, keys: [:photo, :photo_cache, :first_name, :last_name, address_attributes: [:country, :state, :city, :area, :postal_code]])

 end
end
