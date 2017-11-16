Rails.application.routes.draw do
  get 'requests/index'

  get 'requests/show'

  get 'requests/new'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'users/show'
  get 'favorite_jobs/index'
  get 'users/favorite'
  get 'conversations/index'

  devise_for :users

  resources :users

  resources :requests

  resources :favorite_jobs, only: [:create,:destroy] 
  resources :personal_messages, only: [:create]
  resources :conversations, only: [:index, :show]
  resources :personal_messages, only: [:new, :create]

  
  

  resources :conversations do
  resources :messages
   end

  resources :users do
    resources :reviews 

  end 

  resources :jobs do
  resources :comments
  end 
  
  
  resources :jobs do
    resources :reviews

    collection do
      get 'search'


    end


  end

  

  

  root 'jobs#index'
end
