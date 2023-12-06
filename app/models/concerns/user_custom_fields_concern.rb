
module UserCustomFieldsConcern
    extend ActiveSupport::Concern
 
    included do

        # Avant la validation, appel des méthodes pour le nom complet, le prénom et le nom de famille
        before_validation :full_name, :first_name, :last_name
       

        # Méthode pour extraire le prénom du nom complet
        def first_name
            self.first_name = full_name.split.first.capitalize if full_name.present?
        end

        # Méthode pour extraire le nom de famille du nom complet
        def last_name
            self.last_name = full_name.split.last.capitalize if full_name.present?
        end

       
    end
end
