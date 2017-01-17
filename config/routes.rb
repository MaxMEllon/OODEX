require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web, at: '/sidekiq'

  devise_for :users
  devise_scope :user do
    root to: 'devise/sessions#new'
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  get 'my', to: 'my#index', as: :my
  get 'inquiry', to: 'top#inquiry', as: :inquiry
  post 'inquiry/post', to: 'top#post_inquiry', as: :post_inquiry

end
