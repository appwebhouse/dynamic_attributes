Rails.application.routes.draw do
  namespace :admin do
    resources :categories
  end

  resources :categories, only: [:index, :show]

  root 'categories#index'
end
