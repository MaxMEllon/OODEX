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

require 'rails_helper'

RSpec.describe Team, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to :contest }
    it { is_expected.to have_many(:users).through(:players) }
  end
end
