require "application_system_test_case"

class BadgesTest < ApplicationSystemTestCase
  setup do
    @badge = badges(:one)
  end

  test "visiting the index" do
    visit badges_url
    assert_selector "h1", text: "Badges"
  end

  test "should create badge" do
    visit badges_url
    click_on "New badge"

    fill_in "Category", with: @badge.category_id
    fill_in "Count", with: @badge.count
    fill_in "Description", with: @badge.description
    fill_in "Goal type", with: @badge.goal_type
    fill_in "Name", with: @badge.name
    click_on "Create Badge"

    assert_text "Badge was successfully created"
    click_on "Back"
  end

  test "should update Badge" do
    visit badge_url(@badge)
    click_on "Edit this badge", match: :first

    fill_in "Category", with: @badge.category_id
    fill_in "Count", with: @badge.count
    fill_in "Description", with: @badge.description
    fill_in "Goal type", with: @badge.goal_type
    fill_in "Name", with: @badge.name
    click_on "Update Badge"

    assert_text "Badge was successfully updated"
    click_on "Back"
  end

  test "should destroy Badge" do
    visit badge_url(@badge)
    click_on "Destroy this badge", match: :first

    assert_text "Badge was successfully destroyed"
  end
end
