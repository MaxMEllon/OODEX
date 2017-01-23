# frozen_string_literal: true
# == Schema Information
#
# Table name: questions
#
#  content     :text             not null
#  created_at  :datetime         not null
#  id          :integer          not null, primary key
#  subjects_id :integer
#  title       :string           not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_questions_on_subjects_id  (subjects_id)
#

require 'rails_helper'

RSpec.describe Question, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to :subject }
  end
end
