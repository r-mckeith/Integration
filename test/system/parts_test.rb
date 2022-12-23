require "application_system_test_case"

class PartsTest < ApplicationSystemTestCase
  setup do
    @part = parts(:first) # Reference to the first fixture part
  end

  test "Creating a new part" do
    # When we visit the Parts#index page
    # we expect to see a title with the text "Parts"
    visit parts_path
    assert_selector "h1", text: "Parts"

    # When we click on the link with the text "New Part"
    # we expect to land on a page with the title "New part"
    click_on "New part"
    assert_selector "h1", text: "New part"

    # When we fill in the name input with "Capybara part"
    # and we click on "Create Part"
    fill_in "Name", with: "Capybara part"
    click_on "Create part"

    # We expect to be back on the page with the title "Parts"
    # and to see our "Capybara part" added to the list
    assert_selector "h1", text: "Parts"
    assert_text "Capybara part"
  end

  test "Showing a part" do
    visit partss_path
    click_link @part.name

    assert_selector "h1", text: @part.name
  end

  test "Updating a part" do
    visit parts_path
    assert_selector "h1", text: "Parts"

    click_on "Edit", match: :first
    assert_selector "h1", text: "Edit part"

    fill_in "Name", with: "Updated name"
    click_on "Update part"

    assert_selector "h1", text: "Parts"
    assert_text "Updated part"
  end

  test "Destroying a part" do
    visit parts_path
    assert_text @part.name

    click_on "Delete", match: :first
    assert_no_text @part.name
  end
end
