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

class Question < ApplicationRecord
  belongs_to :subject
  has_many :submissions
  has_many :players, through: :submissions
end
