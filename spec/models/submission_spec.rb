# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Submission, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to :question }
    it { is_expected.to belong_to :player }
  end
end
