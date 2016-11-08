Rails.application.routes.draw do
  devise_for :users
  resources :jobs do
  	resources :reviews
  end
  root 'jobs#index'
end
