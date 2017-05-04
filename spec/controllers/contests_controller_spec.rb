# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ContestsController, type: :controller do
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

  describe 'GET #edit' do
    let(:contest) { create :contest }
    subject { get :edit, params: { id: contest.id } }
    context 'admin user' do
      before { sign_in admin }

      it 'returns have_http_status' do
        expect(subject).to have_http_status(200)
      end
    end
  end

  describe 'DELETE #destroy' do
    before { sign_in admin }
    subject do
      ->(id) { delete :destroy, params: { id: id } }
    end
    it 'expect decrease Contest count when destroy contest' do
      contest = create :contest
      expect { subject[contest.id] }.to change(Contest, :count).by(-1)
    end
  end

  describe 'PUT #update' do
    let(:contest) { create :contest }
    let(:params) do
      {
        start_at: DateTime.now.iso8601,
        end_at: DateTime.now.iso8601,
        title: 'updated title'
      }
    end
    before { sign_in admin }

    it 'expect success when put modify titles' do
      put :update, params: { id: contest.id, contest: params }
      expect(Contest.find(contest.id).title).to eq('updated title')
    end

    it 'expect fail when put not enough params' do
      fail_params = params.delete(:start_at)
      put :update, params: { id: contest.id, contest: fail_params }
      expect(flash['alert']).to match('開始日時')
    end
  end

  describe 'POST #create' do
    let(:c) { build :contest }
    let(:params) do
      ->(start_at: c.start_at.to_s, end_at: c.start_at.to_s, title: c.title) do
        { start_at: start_at, end_at: end_at, title: title }
      end
    end
    before { sign_in admin }
    subject { post :create, params: { contest: params[] } }

    it 'redirect to my path if create success of contest' do
      count = Contest.count
      expect { subject }.to change(Contest, :count).by(count + 1)
    end

    it 'fail create when start_at empty' do
      post :create, params: { contest: params[start_at: nil] }
      expect(flash['alert']).to match('開始日時')
    end

    it 'fail create when end_at empty' do
      post :create, params: { contest: params[end_at: nil] }
      expect(flash['alert']).to match('終了日時')
    end

    it 'fail create when title empty' do
      post :create, params: { contest: params[title: nil] }
      expect(flash['alert']).to match('タイトル')
    end
  end

  describe 'PUT #active/#passive' do
    let(:contest) { create :contest }
    before { sign_in admin }

    it 'expect success when execute to patch of active' do
      patch :active, params: { id: contest.id }
      expect(Contest.last.active?).to be(true)
    end

    it 'expect success when execute to patch of passive' do
      patch :passive, params: { id: contest.id }
      expect(Contest.last.active?).to be(false)
    end
  end
end
