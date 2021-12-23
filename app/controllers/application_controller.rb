class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
# before_action :configure_permitted_parameters

# def configure_permitted_parameters
#   devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :encrypted_password])
# end

before_action :configure_permitted_parameters, if: :devise_controller?


#def after_admin_sign_in_path_for(resource)
#  admin_products_path
#end

def after_sign_in_path_for(resource)
  products_path
end



protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number])
  end

end
