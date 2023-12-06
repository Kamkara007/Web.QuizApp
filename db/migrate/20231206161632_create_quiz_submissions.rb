class CreateQuizSubmissions < ActiveRecord::Migration[7.0]
  def change
    create_table :quiz_submissions do |t|
      t.json :user_answers
      t.float :score
      t.references :user, null: false, foreign_key: true
      t.references :quiz, null: false, foreign_key: true

      t.timestamps
    end
  end
end
