json.extract! question, :id, :content, :answer1, :answer2, :answer3, :answer4, :correct_answer, :quiz_id, :created_at, :updated_at
json.url question_url(question, format: :json)
json.content question.content.to_s
json.answer1 question.answer1.to_s
json.answer2 question.answer2.to_s
json.answer3 question.answer3.to_s
json.answer4 question.answer4.to_s
