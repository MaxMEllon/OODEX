# frozen_string_literal: true
class Admin::ContestsController < ApplicationController
  before_action :before_user_not_admin!
  before_action :set_flash, only: :create
  before_action :set_title, only: :create
  before_action :set_start_at, only: :create
  before_action :set_end_at, only: :create

  def new
    @contest = Contest.new
  end

  def create
    unless @flash.blank?
      flash['alert'] = @flash.join(',') << 'が足りません'
      @contest = Contest.new
      redirect_to new_admin_contest_path
      return false
    end
    Contest.create(title: @title, start_at: @start_at, end_at: @end_at)
    redirect_to my_path
  end

  def active
    @content = Contest.find(params[:contest_id])
    @content.is_active = true
    @content.save
    redirect_to my_path
  end

  def passive
    @content = Contest.find(params[:contest_id])
    @content.is_active = false
    @content.save
    redirect_to my_path
  end

  private

    def set_flash
      @flash = []
    end

    def set_title
      is_empty = params['contest']['title'].blank?
      @flash.push('タイトル') if is_empty
      @title = params['contest']['title'] unless is_empty
    end

    def set_start_at
      is_empty = params['contest']['start_at'].blank?
      @flash.push('開始日時') if is_empty
      @start_at = Time.zone.parse(params['contest']['start_at']) unless is_empty
    end

    def set_end_at
      is_empty = params['contest']['end_at'].blank?
      @flash.push('終了日時') if is_empty
      @end_at = Time.zone.parse(params['contest']['end_at']) unless is_empty
    end
end
