# frozen_string_literal: true

require 'rails_helper'

feature 'User updates part' do
  given!(:part) { create(:part) }
  given!(:new_part) { create(:part) }

  scenario 'with valid input' do
    visit parts_path
    find("a[href='/parts/#{part.id}']").click
    find("a[href='/parts/#{part.id}/edit']").click
    fill_in 'Name', with: new_part.name
    fill_in 'Description', with: new_part.description
    select new_part.role, :from => 'Role'
    click_button 'Update Part'
    expect(page).to have_content 'Your part was updated'
    expect(page).to have_content "#{new_part.name}"
  end

  scenario 'with valid input' do
    visit parts_path
    find("a[href='/parts/#{part.id}']").click
    find("a[href='/parts/#{part.id}/edit']").click
    fill_in 'Name', with: nil
    click_button 'Update Part'
    expect(page).to have_content 'There was a problem updating your part'
    expect(page).to have_content "#{part.description}"
  end
end
