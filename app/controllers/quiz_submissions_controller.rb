class QuizSubmissionsController < ApplicationController
  before_action :find_quiz_submission, only: %i[show]

  # GET /quiz_submissions or /quiz_submissions.json
  def index
    @quiz_submissions = QuizSubmission.all
  end

 

  # GET /quiz_submissions/new
  def new
    @quiz_submission = QuizSubmission.new
  end

  # GET /quiz_submissions/1/edit
  def edit
  end

  def show
    @quiz = @quiz_submission.quiz
  end

  def create
    @quiz = Quiz.find(params[:quiz_id])

    user_answers = {}
    correct_answers = 0

    params.each do |key, value|
      next unless key.start_with?('question_')

      question_id = key.split('_').last.to_i
      selected_answer = value.to_i
      user_answers[question_id.to_s] = selected_answer
      question = Question.find(question_id)

      correct_answers += 1 if question.correct_answer == selected_answer
    end

    score = (correct_answers.to_f / @quiz.questions.count) * 100
    @quiz_submission = QuizSubmission.create(quiz: @quiz, user: current_user, score:, user_answers:)

    redirect_to quiz_submission_path(@quiz, @quiz_submission)
  end

  # PATCH/PUT /quiz_submissions/1 or /quiz_submissions/1.json
  def update
    respond_to do |format|
      if @quiz_submission.update(quiz_submission_params)
        format.html { redirect_to quiz_submission_url(@quiz_submission), notice: "Quiz submission was successfully updated." }
        format.json { render :show, status: :ok, location: @quiz_submission }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @quiz_submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quiz_submissions/1 or /quiz_submissions/1.json
  def destroy
    @quiz_submission.destroy

    respond_to do |format|
      format.html { redirect_to quiz_submissions_url, notice: "Quiz submission was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  def find_quiz_submission
    @quiz_submission = QuizSubmission.find(params[:id])
  end

  def quiz_submission_params
    params.require(:quiz_submission).permit(:quiz_id, :user_id, :score, user_answers: {})
  end
end
