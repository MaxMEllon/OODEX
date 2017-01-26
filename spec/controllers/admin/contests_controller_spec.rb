# frozen_string_literal: true
require 'rails_helper'
RSpec.describe Admin::ContestsController, type: :controller do
  let(:admin) { create :admin }
  let(:user) { create :user }

  describe 'GET #new' do
    subject { get :new }
    context 'admin user' do
      before { sign_in admin }

      it 'returns http success' do
        expect(subject).to have_http_status(200)
        expect(subject).to render_template('new')
      end

      it 'redirect to root path if sign out user' do
        sign_out admin
        expect(subject).to have_http_status(401)
      end
    end

    context 'default user' do
      before { sign_in user }
      it 'redirect to my path if sign in deffault user' do
        expect(subject).to have_http_status(401)
      end
    end
  end

  describe 'post #create' do
    let(:contest) { build :contest }
    let(:params) do
      {
        start_at: contest.start_at.to_s,
        end_at: contest.start_at.to_s,
        title: contest.title
      }
    end
    before { sign_in admin }
    subject { post :create, params: { contest: params } }

    it 'redirect to my path if create success of contest' do
      expect do
        subject
      end.to change(Contest, :count).by(1)
    end

    it 'fail create when start_at empty' do
      fail_params = params.delete(:start_at)
      post :create, params: { contest: fail_params }
      expect(flash['alert']).to match('開始日時')
    end

    it 'fail create when end_at empty' do
      fail_params = params.delete(:end_at)
      post :create, params: { contest: fail_params }
      expect(flash['alert']).to match('終了日時')
    end

    it 'fail create when title empty' do
      fail_params = params.delete(:title)
      post :create, params: { contest: fail_params }
      expect(flash['alert']).to match('タイトル')
    end
  end

  describe 'patch #active/#passive' do
    let(:contest) { create :contest }
    before { sign_in admin }

    it 'expect success when execute to patch of active' do
      patch :active, params: { contest_id: Contest.last.id }
      expect(Contest.last.active?).to be(true)
    end

    it 'expect success when execute to patch of passive' do
      patch :passive, params: { contest_id: Contest.last.id }
      expect(Contest.last.active?).to be(false)
    end
  end
end
