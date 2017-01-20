# frozen_string_literal: true
# == Schema Information
#
# Table name: players
#
#  id         :integer          not null, primary key
#  is_active  :boolean          default("true"), not null
#  name       :string           not null
#  role       :integer          default("0"), not null
#  user_id    :integer          not null
#  contest_id :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# frozen_string_literal: true
class Player < ApplicationRecord
  belongs_to :user
  belongs_to :contest
end
