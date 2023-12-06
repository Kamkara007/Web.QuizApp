json.extract! quiz_submission, :id, :user_answers, :score, :user_id, :quiz_id, :created_at, :updated_at
json.url quiz_submission_url(quiz_submission, format: :json)
