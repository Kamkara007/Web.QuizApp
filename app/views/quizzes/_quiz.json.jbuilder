json.extract! quiz, :id, :title, :content, :slug, :course_id, :user_id, :created_at, :updated_at
json.url quiz_url(quiz, format: :json)
json.content quiz.content.to_s
