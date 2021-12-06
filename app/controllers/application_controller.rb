class ApplicationController < ActionController::Base
# before_action :configure_permitted_parameters

# def configure_permitted_parameters
#   devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :encrypted_password])
# end

def after_sign_in_path_for(resource)
  admin_top_path
end

end
