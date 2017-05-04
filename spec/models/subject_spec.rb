# frozen_string_literal: true

# == Schema Information
#
# Table name: subjects
#
#  contest_id :integer
#  created_at :datetime         not null
#  detail     :text             not null
#  id         :integer          not null, primary key
#  title      :string           not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_subjects_on_contest_id  (contest_id)
#

require 'rails_helper'

RSpec.describe Subject, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to :contest }
    it { is_expected.to have_many :questions }
  end
end
