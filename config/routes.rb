Rails.application.routes.draw do
  get 'users/show'

  devise_for :users

  resources :users


  resources :conversations do
  resources :messages
end




  resources :jobs do
    resources :reviews

    collection do
      get 'search'


    end
  end

 

  root 'jobs#index'
end
