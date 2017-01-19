# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Contest, type: :model do
  describe 'associations' do
    it { is_expected.to have_many :players }
  end
end
