class ApplicationController < ActionController::Base

    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :set_levels, :set_materials

    private
     #set Level
     def set_levels
        @levels = Level.all.ordered
      end
  
      def set_materials
        @materials = Material.all.ordered
      end
      protected

      def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:full_name, :first_name, :last_name])
      end

end
