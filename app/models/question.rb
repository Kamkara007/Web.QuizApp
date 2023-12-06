class Question < ApplicationRecord
  belongs_to :quiz
  has_rich_text :content
  has_rich_text :answer1
  has_rich_text :answer2
  has_rich_text :answer3
  has_rich_text :answer4


  
  validates :correct_answer, inclusion: { in: 1..4 }
end
