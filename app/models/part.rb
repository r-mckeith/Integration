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
class Part < ApplicationRecord
  validates_presence_of :name, :role
  validates :description, length: { minimum: 25 }

  ROLES = %w(Manager Firefighter Exile)
  validates :role, inclusion: { in: ROLES }
end
