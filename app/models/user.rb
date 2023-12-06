class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :levels
         has_many :materials
         has_many :courses
         has_many :quizzes
         has_many :quiz_submissions
  ############# CONCERNs ##################
  include  UserCustomFieldsConcern
  include SignUpConcern
  include SignInConcern
end
