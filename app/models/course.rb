class Course < ApplicationRecord
 
  ############# RELATIONS ###########
  belongs_to :user
  belongs_to :material
  belongs_to :level
  has_many :essentials, dependent: :destroy
  has_many :quizzes, dependent: :destroy
 
  ############# ACTION TEXT ##############
  has_rich_text :content
 
  #############  VALIDATIONS ##############
  validates :content, presence: { message: "Le nom est obligatoire" }
  validates :user_id, presence: { message: "Le createur est obligatoire" }
  validates :level_id, presence: { message: "Le niveau est obligatoire" }
  validates :material_id, presence: { message: "La matiere est obligatoire" }
    
  #validate :acceptable_image #https://github.com/igorkasyanchuk/active_storage_validations
   
    
  #############  SLUGGED ##############
  include ItemsSluggedConcern
end

