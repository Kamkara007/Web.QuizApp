class Level < ApplicationRecord
  belongs_to :user

  has_and_belongs_to_many :schools
  

#############  SLUGGED ##############
  include LevelsSluggedConcern
end
