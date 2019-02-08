Rails.application.routes.draw do


  namespace :admin do
    resources :impressions
    resources :users
    resources :categories
    resources :cities
    resources :comments
    resources :favorites
    resources :jobs
    resources :notifications
    resources :prices
    resources :requests
    resources :reviews

    root to: "impressions#index"
  end

  get 'requests/index'

  get 'requests/show'

  get 'requests/new'
  get 'jobs/all'
  get 'categories/show'
  get 'categories/index'



  get "mailbox/inbox" => "mailbox#inbox", as: :mailbox_inbox

  get "mailbox/sent" => "mailbox#sent", as: :mailbox_sent

  get "mailbox/trash" => "mailbox#trash", as: :mailbox_trash

 
  get 'users/show'

  get 'favorite_jobs/index'

  get 'users/favorite'

  get 'conversations/index'
  get 'jobs/search' => 'jobs#search', as: 'search_jobs'

  get 'jobs/contact' => 'jobs#contact'
  get 'jobs/tos'
  get 'jobs/aboutus'





  


  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :users
  resources :jobs
  resources :contacts, only: [:new, :create]

  resources :requests
 

  resources :favorite_jobs, only: [:create,:destroy] 

 

  
  

  resources :conversations do
  member do
    post :reply

    post :trash

    post :untrash
   end
   end


   resources :requests do
    member do
      patch :complete
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

