Rails.application.routes.draw do
  namespace :admin do
    resources :courses do
      resources :posts
    end
  end

  resources :courses

  devise_for :users
  root 'courses#index'
  # root 'welcome#index'
end
