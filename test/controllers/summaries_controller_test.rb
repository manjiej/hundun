require 'test_helper'

class SummariesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @summary = summaries(:one)
  end

  test "should get index" do
    get summaries_url
    assert_response :success
  end

  test "should get new" do
    get new_summary_url
    assert_response :success
  end

  test "should create summary" do
    assert_difference('Summary.count') do
      post summaries_url, params: { summary: { article_id: @summary.article_id, text: @summary.text, title: @summary.title, user_id: @summary.user_id } }
    end

    assert_redirected_to summary_url(Summary.last)
  end

  test "should show summary" do
    get summary_url(@summary)
    assert_response :success
  end

  test "should get edit" do
    get edit_summary_url(@summary)
    assert_response :success
  end

  test "should update summary" do
    patch summary_url(@summary), params: { summary: { article_id: @summary.article_id, text: @summary.text, title: @summary.title, user_id: @summary.user_id } }
    assert_redirected_to summary_url(@summary)
  end

  test "should destroy summary" do
    assert_difference('Summary.count', -1) do
      delete summary_url(@summary)
    end

    assert_redirected_to summaries_url
  end
end
