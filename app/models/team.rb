# frozen_string_literal: true

# == Schema Information
#
# Table name: teams
#
#  contest_id :integer          not null
#  created_at :datetime         not null
#  id         :integer          not null, primary key
#  name       :string           not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_teams_on_contest_id  (contest_id)
#

class Team < ApplicationRecord
  belongs_to :contest
  has_many :players, dependent: :destroy
  has_many :users, through: :players
end
