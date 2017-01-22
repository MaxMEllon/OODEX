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
class Player < ApplicationRecord
  belongs_to :user
  belongs_to :team
end
