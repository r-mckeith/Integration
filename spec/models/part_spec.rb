# frozen_string_literal: true

# == Schema Information
#
# Table name: parts
#
#  id          :integer          not null, primary key
#  description :text
#  integrated  :boolean
#  name        :string
#  photo       :string
#  protective  :boolean
#  role        :string
#  vulnerable  :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'rails_helper'

RSpec.describe Part, type: :model do
  it 'is valid with valid attributes' do
    valid_part = create(:part)
    expect(valid_part).to be_valid
  end

  it 'is not valid without a name' do
    no_name_part = build(:part, name: nil)
    expect(no_name_part).to_not be_valid
  end

  it 'is not valid with a description that is less than 25 characters long' do
    short_description_part = build(:part, description: 'asdf;lkj')
    expect(short_description_part).to_not be_valid
  end

  it 'is not valid without a role assigned' do
    no_role_part = build(:part, role: nil)
    expect(no_role_part).to_not be_valid
  end
end
