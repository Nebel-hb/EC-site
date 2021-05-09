class ApplicationController < ActionController::Base
   before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [
      :name, 
      :email,
      :name_kana,
      :postcode,
      :prefecture_name,
      :address_city,
      :address_street,
      :address_building,
      ])
  end
end
