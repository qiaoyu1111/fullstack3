Rails.application.routes.draw do
  namespace :admin do
    resources :courses
  end

  devise_for :users
  root 'welcome#index'
end
