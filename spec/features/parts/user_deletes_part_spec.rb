# frozen_string_literal: true

require 'rails_helper'

feature 'User deletes part', js: true do
  given!(:part) { create(:part) }

  scenario do
    visit parts_path
    find("a[href='/parts/#{part.id}']").click # View Button

    accept_confirm do
      find("a[href='/parts/#{part.id}']").click # Delete Button
    end

    expect(page).to have_content 'Your part was deleted'
    expect(page).not_to have_content "#{part.name}"
  end 
end
