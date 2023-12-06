class Quiz < ApplicationRecord
  belongs_to :course
 belongs_to :user
 has_many :questions, dependent: :destroy
 has_many :quiz_submissions, dependent: :destroy

 
 #############  PARAMS ##############
 accepts_nested_attributes_for :questions, reject_if: :all_blank, allow_destroy: true


 ############# ACTION TEXT ##############
 has_rich_text :content

 ############# VALIDATIONS ##############
  validates :content, presence: { message: "Le nom est obligatoire" }
  validates :user_id, presence: { message: "Le createur est obligatoire" }
  validates :course_id, presence: { message: "La leçon est obligatoire" }
    

 #############  SLUGGED ##############
 #include ItemsSluggedConcern
 
  def correct_answer_text
   # answer1, answer2, answer3 are in the model
   send("answer#{correct_answer}")
  end
end
