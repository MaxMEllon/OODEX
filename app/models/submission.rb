# frozen_string_literal: true
class Submission < ApplicationRecord
  belongs_to :player
  belongs_to :question
end
