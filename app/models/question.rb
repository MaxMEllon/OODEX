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

class Question < ApplicationRecord
  belongs_to :subject
end
