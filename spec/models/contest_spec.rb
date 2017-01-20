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
require 'rails_helper'

RSpec.describe Contest, type: :model do
  describe 'associations' do
    it { is_expected.to have_many :players }
  end
end
