# frozen_string_literal: true
# == Schema Information
#
# Table name: contests
#
#  id         :integer          not null, primary key
#  start_at   :datetime         not null
#  end_at     :datetime         not null
#  is_active  :boolean          default("false"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# frozen_string_literal: true
class Contest < ApplicationRecord
  has_many :players
end
