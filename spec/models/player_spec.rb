# frozen_string_literal: true
# == Schema Information
#
# Table name: players
#
#  created_at :datetime         not null
#  id         :integer          not null, primary key
#  is_active  :boolean          default(TRUE), not null
#  name       :string           not null
#  role       :integer          default(0), not null
#  team_id    :integer
#  updated_at :datetime         not null
#  user_id    :integer
#
# Indexes
#
#  index_players_on_team_id  (team_id)
#  index_players_on_user_id  (user_id)
#

# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Player, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to :user }
    it { is_expected.to belong_to :team }
    it { is_expected.to have_many(:questions).through(:submissions) }
  end
end
