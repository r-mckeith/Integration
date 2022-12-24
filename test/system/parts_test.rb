require "application_system_test_case"

class PartsTest < ApplicationSystemTestCase
  setup do
    @part = parts(:first) # Reference to the first fixture part
  end

  test "Creating a new part" do
    # Visit parts index page
    visit parts_path 
    assert_selector "h1", text: "Parts"

    find("a[href='#{new_part_path}']").click # This is a click on "Add Part"
    # Redirected to new parts page
    assert_selector "h1", text: "New Part:" 

    fill_in "Name", with: "Capybara Part"
    select "Manager", :from => "Role"
    fill_in "Description", with: "This is a description for the Capybara Part!"
    fill_in "Photo", with: "https://i.stack.imgur.com/l60Hf.png"
    click_on "Create Part"

    # Redirected back to parts index
    assert_selector "h1", text: "Parts"
    assert_text "Capybara Part"
    assert page.has_xpath?("//img[@src = 'https://i.stack.imgur.com/l60Hf.png' and @alt='https://i.stack.imgur.com/l60Hf.png']")
  end

  # test "Showing a part" do
  #   visit parts_path
  #   find(:xpath, "//img[@src='/parts/1']").click
  #   find(css("img[src*='environ-peeling-kuur.jpg']"))


    # find("a[href='/parts/1']").click
    # click_link @part.name

    assert_selector "h1", text: @part.name
  end

  # test "Updating a part" do
  #   visit parts_path
  #   assert_selector "h1", text: "Parts"

  #   click_on "Edit", match: :first
  #   assert_selector "h1", text: "Edit part"

  #   fill_in "Name", with: "Updated name"
  #   click_on "Update part"

  #   assert_selector "h1", text: "Parts"
  #   assert_text "Updated part"
  # end

  # test "Destroying a part" do
  #   visit parts_path
  #   assert_text @part.name

  #   click_on "Delete", match: :first
  #   assert_no_text @part.name
  # end
end
