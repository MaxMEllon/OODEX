# frozen_string_literal: true
# == Route Map
#
#                   Prefix Verb   URI Pattern                           Controller#Action
#              sidekiq_web        /sidekiq                              Sidekiq::Web
#         new_user_session GET    /users/sign_in(.:format)              devise/sessions#new
#             user_session POST   /users/sign_in(.:format)              devise/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)             devise/sessions#destroy
#        new_user_password GET    /users/password/new(.:format)         devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format)        devise/passwords#edit
#            user_password PATCH  /users/password(.:format)             devise/passwords#update
#                          PUT    /users/password(.:format)             devise/passwords#update
#                          POST   /users/password(.:format)             devise/passwords#create
# cancel_user_registration GET    /users/cancel(.:format)               devise/registrations#cancel
#    new_user_registration GET    /users/sign_up(.:format)              devise/registrations#new
#   edit_user_registration GET    /users/edit(.:format)                 devise/registrations#edit
#        user_registration PATCH  /users(.:format)                      devise/registrations#update
#                          PUT    /users(.:format)                      devise/registrations#update
#                          DELETE /users(.:format)                      devise/registrations#destroy
#                          POST   /users(.:format)                      devise/registrations#create
#                     root GET    /                                     devise/sessions#new
#           users_sign_out GET    /users/sign_out(.:format)             devise/sessions#destroy
#           admin_contests GET    /admin/contests(.:format)             admin/contests#index
#                          POST   /admin/contests(.:format)             admin/contests#create
#        new_admin_contest GET    /admin/contests/new(.:format)         admin/contests#new
#       edit_admin_contest GET    /admin/contests/:id/edit(.:format)    admin/contests#edit
#            admin_contest GET    /admin/contests/:id(.:format)         admin/contests#show
#                          PATCH  /admin/contests/:id(.:format)         admin/contests#update
#                          PUT    /admin/contests/:id(.:format)         admin/contests#update
#                          DELETE /admin/contests/:id(.:format)         admin/contests#destroy
#     admin_contest_active PUT    /admin/contests/active/:id(.:format)  admin/contests#active
#    admin_contest_passive PUT    /admin/contests/passive/:id(.:format) admin/contests#passive
#                       my GET    /my(.:format)                         my#index
#                  inquiry GET    /inquiry(.:format)                    top#inquiry
#             post_inquiry POST   /inquiry/post(.:format)               top#post_inquiry
#

require 'sidekiq/web'

Rails.application.routes.draw do
  authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web, at: '/sidekiq'
  end

  devise_for :users
  devise_scope :user do
    root to: 'devise/sessions#new'
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  namespace :admin do
    resources :contests, except: [:show, :index]
    put '/contests/active/:id' => 'contests#active', as: :contest_active
    put '/contests/passive/:id' => 'contests#passive', as: :contest_passive
  end

  get 'my', to: 'my#index', as: :my
  get 'inquiry', to: 'top#inquiry', as: :inquiry
  post 'inquiry/post', to: 'top#post_inquiry', as: :post_inquiry
end
