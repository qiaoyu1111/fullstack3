Rails.application.routes.draw do
  namespace :admin do
    resources :courses
  end

  resources :courses

  devise_for :users
  root 'courses#index'
  # root 'welcome#index'
end
