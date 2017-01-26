# frozen_string_literal: true
class MyController < ApplicationController
  before_action :authenticate_user!

  def index
    @contests = Contest.order(:start_at)
  end
end
