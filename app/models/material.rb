class Material < ApplicationRecord
  belongs_to :user

  has_and_belongs_to_many :levels
    
    #############  SLUGGED ##############
  include LevelsSluggedConcern
end
