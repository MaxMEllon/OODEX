# frozen_string_literal: true
class ContestsController < ApplicationController
  before_action :before_user_not_admin!
  before_action :set_flash, only: [:create, :update]
  before_action :set_title, only: [:create, :update]
  before_action :set_start_at, only: [:create, :update]
  before_action :set_end_at, only: [:create, :update]

  def new
    @contest = Contest.new
    @action = :create
    @head = 'コンテストを作成する'
  end

  def create
    unless @flash.blank?
      flash['alert'] = @flash.join(',') << 'が足りません'
      @contest = Contest.new
      redirect_to new_contest_path
      return false
    end
    flash['notice'] = '作成しました'
    Contest.create(title: @title, start_at: @start_at, end_at: @end_at)
    redirect_to my_path
  end

  def active
    toggle(true, '有効にしました')
    redirect_to my_path
  end

  def passive
    toggle(false, '無効にしました')
    redirect_to my_path
  end

  def edit
    @contest = Contest.find(params[:id])
    @action = :update
    @head = 'コンテストを編集する'
  end

  def update
    @contest = Contest.find(params[:id])
    unless @flash.blank?
      flash['alert'] = @flash.join(',') << 'が足りません'
      redirect_to edit_contest_path
      return false
    end
    flash['notice'] = '更新しました'
    @contest.update(title: @title, start_at: @start_at, end_at: @end_at)
    redirect_to my_path
  end

  def destroy
    @contest = Contest.find(params[:id])
    flash['notice'] = "コンテスト `#{@contest.title}` を削除しました"
    @contest.destroy
    redirect_to my_path
  end

  private

    def toggle(state, message = '')
      @content = Contest.find(params[:id])
      @content.is_active = state
      flash['notice'] = message
      @content.save
    end

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
