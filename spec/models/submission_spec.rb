# frozen_string_literal: true

# == Schema Information
#
# Table name: submissions
#
#  code        :text             not null
#  created_at  :datetime         not null
#  id          :integer          not null, primary key
#  player_id   :integer
#  question_id :integer
#  status      :integer          not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_submissions_on_player_id    (player_id)
#  index_submissions_on_question_id  (question_id)
#

require 'rails_helper'

RSpec.describe Submission, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to :question }
    it { is_expected.to belong_to :player }
  end
end
