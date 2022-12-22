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
require "test_helper"

class PartTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
