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

class Subject < ApplicationRecord
  belongs_to :contest
end
