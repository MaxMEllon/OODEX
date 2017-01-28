# frozen_string_literal: true
# == Schema Information
#
# Table name: questions
#
#  content    :text             not null
#  created_at :datetime         not null
#  id         :integer          not null, primary key
#  subject_id :integer
#  title      :string           not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_questions_on_subject_id  (subject_id)
#

require 'rails_helper'

RSpec.describe Question, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to :subject }
    it { is_expected.to have_many(:players).through(:submissions) }
  end
end
