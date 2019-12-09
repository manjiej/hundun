require "application_system_test_case"

class SummariesTest < ApplicationSystemTestCase
  setup do
    @summary = summaries(:one)
  end

  test "visiting the index" do
    visit summaries_url
    assert_selector "h1", text: "Summaries"
  end

  test "creating a Summary" do
    visit summaries_url
    click_on "New Summary"

    fill_in "Article", with: @summary.article_id
    fill_in "Text", with: @summary.text
    fill_in "Title", with: @summary.title
    fill_in "User", with: @summary.user_id
    click_on "Create Summary"

    assert_text "Summary was successfully created"
    click_on "Back"
  end

  test "updating a Summary" do
    visit summaries_url
    click_on "Edit", match: :first

    fill_in "Article", with: @summary.article_id
    fill_in "Text", with: @summary.text
    fill_in "Title", with: @summary.title
    fill_in "User", with: @summary.user_id
    click_on "Update Summary"

    assert_text "Summary was successfully updated"
    click_on "Back"
  end

  test "destroying a Summary" do
    visit summaries_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Summary was successfully destroyed"
  end
end
