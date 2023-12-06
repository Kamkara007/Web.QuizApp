require "application_system_test_case"

class QuizSubmissionsTest < ApplicationSystemTestCase
  setup do
    @quiz_submission = quiz_submissions(:one)
  end

  test "visiting the index" do
    visit quiz_submissions_url
    assert_selector "h1", text: "Quiz submissions"
  end

  test "should create quiz submission" do
    visit quiz_submissions_url
    click_on "New quiz submission"

    fill_in "Quiz", with: @quiz_submission.quiz_id
    fill_in "Score", with: @quiz_submission.score
    fill_in "User answers", with: @quiz_submission.user_answers
    fill_in "User", with: @quiz_submission.user_id
    click_on "Create Quiz submission"

    assert_text "Quiz submission was successfully created"
    click_on "Back"
  end

  test "should update Quiz submission" do
    visit quiz_submission_url(@quiz_submission)
    click_on "Edit this quiz submission", match: :first

    fill_in "Quiz", with: @quiz_submission.quiz_id
    fill_in "Score", with: @quiz_submission.score
    fill_in "User answers", with: @quiz_submission.user_answers
    fill_in "User", with: @quiz_submission.user_id
    click_on "Update Quiz submission"

    assert_text "Quiz submission was successfully updated"
    click_on "Back"
  end

  test "should destroy Quiz submission" do
    visit quiz_submission_url(@quiz_submission)
    click_on "Destroy this quiz submission", match: :first

    assert_text "Quiz submission was successfully destroyed"
  end
end
