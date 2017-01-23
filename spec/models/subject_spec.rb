# frozen_string_literal: true
# == Schema Information
#
# Table name: subjects
#
#  content_id :integer          not null
#  created_at :datetime         not null
#  detail     :text             not null
#  id         :integer          not null, primary key
#  title      :string           not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Subject, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to :contest }
  end
end
