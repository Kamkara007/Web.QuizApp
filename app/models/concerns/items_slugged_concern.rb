#Whitelist additional fields for devise User objects.
module ItemsSluggedConcern
   extend ActiveSupport::Concern

   included do
      validates :title, length: { minimum:10, maximum: 150,
      message:"Verifiez que le titre n'est pas trop long. la longueur du titre est limité 150 caracteres"}
      


      extend FriendlyId
         friendly_id :title, use: :slugged

 
         def should_generate_new_friendly_id?
            title_changed?
         end

      before_save do
         self.title = self.title.capitalize
      end  
   end
   

   ################## SLUG ###############  
   def should_generate_new_friendly_id?
      title_changed?
   end

end
