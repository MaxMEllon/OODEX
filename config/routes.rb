require 'sidekiq/web'

Rails.application.routes.draw do
  root to: 'top#index'

  TEE::Application.routes.draw do
    mount Sidekiq::Web, at: '/sidekiq'
  end

  get 'inquiry', to: 'top#inquiry', as: :inquiry
  post 'inquiry/post', to: 'top#post_inquiry', as: :post_inquiry
end
