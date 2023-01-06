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
#  user_id     :integer          not null
#
# Indexes
#
#  index_parts_on_user_id  (user_id)
#
# Foreign Keys
#
#  user_id  (user_id => users.id)
#
class Part < ApplicationRecord
  belongs_to :user

  validates_presence_of :name, :role
  validates :description, length: { minimum: 25 }

  ROLES = %w[Manager Firefighter Exile].freeze
  validates :role, inclusion: { in: ROLES }, unless: :self_part?

  private

  def self_part?
    name == 'Self'
  end
end
