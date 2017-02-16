# frozen_string_literal: true
class SubjectsController < ApplicationController
  before_action :set_contest
  before_action :set_flash, only: [:create]
  before_action :set_title, only: [:create]
  before_action :set_detail, only: [:create]

  def index
    @subjects = @contest.subjects
  end

  def new
    @subject = @contest.subjects.new
    @head = '問題の作成'
    @action = :create
  end

  def create
    show_flash_if_needed
    flash['notice'] = '作成しました'
    @subject = @contest.subjects.create(title: @title, detail: @detail)
    redirect_to contest_subjects_path(@contest.id)
  end

  private

    def show_flash_if_needed
      return if @flash.blank?
      flash['alert'] = @flash.join(',') << 'が足りません'
      @subject = @contest.subjects.new
      redirect_to new_contest_subject_path(@contest.id)
    end

    def set_flash
      @falsh = []
    end

    def set_title
      is_empty = params['subject']['title'].blank?
      @flash.push('タイトル') if is_empty
      @title = params['subject']['title'] unless is_empty
    end

    def set_detail
      is_empty = params['subject']['detail'].blank?
      @flash.push('詳細') if is_empty
      @detail = params['subject']['detail'] unless is_empty
    end

    def set_contest
      unless params['contest_id']
        flash['alert'] = '存在しないコンテストを参照しました'
        return false
      end

      @contest = Contest.find(params['contest_id'])
    end
end
