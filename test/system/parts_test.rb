# frozen_string_literal: true

require 'application_system_test_case'

# app/models/part.rb
class PartsTest < ApplicationSystemTestCase
  setup do
    @part = parts(:first) # Reference to the first fixture part
  end

  test 'Creating a new part' do
    # Visit parts index page
    visit parts_path 
    assert_selector 'h1', text: 'Parts'
    find("a[href='#{new_part_path}']").click # Click on 'Add Part'

    # Redirected to new parts page
    assert_selector 'h1', :text => 'New Part:'
    fill_in 'Name', with: 'Capybara Part'
    select 'Manager', :from => 'Role'
    fill_in 'Description', with: 'This is a description for the Capybara Part!'
    fill_in 'Photo', with: 'https://i.stack.imgur.com/l60Hf.png'
    click_on 'Create Part'

    # Redirected back to parts index page
    assert_selector 'h1', text: 'Parts'
    assert_text 'Capybara Part'
    assert page.has_xpath?("//img[@src = 'https://i.stack.imgur.com/l60Hf.png' and @alt='https://i.stack.imgur.com/l60Hf.png']")
  end

  test 'Showing a part' do
    visit parts_path
    page.find(:xpath, '/html/body/div[1]/div[1]/div/div/turbo-frame/a/img').click

    assert_selector 'h5', text: @part.name
    assert_selector 'p', text: @part.description
    assert_selector 'li', text: @part.role

    if @part.vulnerable
      assert_selector 'li', text: 'Vulnerable'
    else
      assert_selector 'li', text: 'Protective'
    end

    unless @part.integrated
      assert_selector 'li', text: 'Not integrated'
    end

    assert_selector 'a', text: 'Edit'
    assert_selector 'a', text: 'Delete'
  end

  test 'Updating a part' do
    visit parts_path
    page.find(:xpath, '/html/body/div[1]/div[1]/div/div/turbo-frame/a/img').click

    click_on 'Edit', match: :first
    assert_selector 'h1', text: 'Editing Part'

    fill_in 'Name', with: 'Updated name'
    click_on 'Update Part'

    assert_text 'Updated name'
  end

  test 'Destroying a part' do
    visit parts_path
    page.find(:xpath, '/html/body/div[1]/div[1]/div/div/turbo-frame/a/img').click

    click_on 'Delete', match: :first
    page.driver.browser.switch_to.alert.accept
    assert_no_text @part.name
  end
end
