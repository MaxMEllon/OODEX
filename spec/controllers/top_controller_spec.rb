# frozen_string_literal: true
require 'rails_helper'

RSpec.describe TopController, type: :controller do
  describe 'GET #inquiry' do
    it 'returns http success' do
      get :inquiry
      expect(response).to have_http_status(200)
    end
  end
end
