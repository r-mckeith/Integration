# frozen_string_literal: true

require 'rails_helper'

feature 'User creates part' do
  given!(:part) { create(:part) }

  scenario 'with valid input' do
    visit parts_path
    click_link 'Add a part'
    fill_in 'Name', with: part.name
    fill_in 'Description', with: part.description
    select part.role, :from => 'Role'
    click_button 'Create Part'
    expect(page).to have_content 'Your new part was saved'
  end

  scenario 'without valid input' do
    visit parts_path
    click_link 'Add a part'
    fill_in 'Name', with: nil
    fill_in 'Description', with: part.description
    select part.role, :from => 'Role'
    click_button 'Create Part'
    expect(page).to have_content 'There was a problem saving your part'
  end
end
