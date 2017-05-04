# frozen_string_literal: true
# == Schema Information
#
# Table name: contests
#
#  created_at :datetime         not null
#  end_at     :datetime         not null
#  id         :integer          not null, primary key
#  is_active  :boolean          default(FALSE), not null
#  start_at   :datetime         not null
#  title      :string           not null
#  updated_at :datetime         not null
#

# frozen_string_literal: true

class Contest < ApplicationRecord
  has_many :teams
  has_many :subjects

  def active?
    is_active
  end
end
