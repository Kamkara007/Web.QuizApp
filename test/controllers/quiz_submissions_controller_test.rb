require "test_helper"

class QuizSubmissionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @quiz_submission = quiz_submissions(:one)
  end

  test "should get index" do
    get quiz_submissions_url
    assert_response :success
  end

  test "should get new" do
    get new_quiz_submission_url
    assert_response :success
  end

  test "should create quiz_submission" do
    assert_difference("QuizSubmission.count") do
      post quiz_submissions_url, params: { quiz_submission: { quiz_id: @quiz_submission.quiz_id, score: @quiz_submission.score, user_answers: @quiz_submission.user_answers, user_id: @quiz_submission.user_id } }
    end

    assert_redirected_to quiz_submission_url(QuizSubmission.last)
  end

  test "should show quiz_submission" do
    get quiz_submission_url(@quiz_submission)
    assert_response :success
  end

  test "should get edit" do
    get edit_quiz_submission_url(@quiz_submission)
    assert_response :success
  end

  test "should update quiz_submission" do
    patch quiz_submission_url(@quiz_submission), params: { quiz_submission: { quiz_id: @quiz_submission.quiz_id, score: @quiz_submission.score, user_answers: @quiz_submission.user_answers, user_id: @quiz_submission.user_id } }
    assert_redirected_to quiz_submission_url(@quiz_submission)
  end

  test "should destroy quiz_submission" do
    assert_difference("QuizSubmission.count", -1) do
      delete quiz_submission_url(@quiz_submission)
    end

    assert_redirected_to quiz_submissions_url
  end
end
