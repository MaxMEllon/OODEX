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
require 'rails_helper'

RSpec.describe Contest, type: :model do
  describe 'associations' do
    it { is_expected.to have_many :teams }
    it { is_expected.to have_many :subjects }
  end
end
