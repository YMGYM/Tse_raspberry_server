Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # devise_for :users
  resources :posts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :tasks, except: [:new, :edit] do
    resources :works, except: [:new, :edit]
  end
end
