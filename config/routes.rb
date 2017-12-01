Rails.application.routes.draw do
  get 'requests/index'

  get 'requests/show'

  get 'requests/new'

  get "mailbox/inbox" => "mailbox#inbox", as: :mailbox_inbox

  get "mailbox/sent" => "mailbox#sent", as: :mailbox_sent

  get "mailbox/trash" => "mailbox#trash", as: :mailbox_trash

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'users/show'

  get 'favorite_jobs/index'

  get 'users/favorite'

  get 'conversations/index'

  devise_for :users

  resources :users

  resources :requests

  resources :favorite_jobs, only: [:create,:destroy] 

 

  
  

  resources :conversations do
  member do
    post :reply

    post :trash

    post :untrash
   end
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
