Rails.application.routes.draw do
  devise_for :users
  resources :jobs do
  	resources :reviews

  	collection do
  		get 'search'
  	end
  end
  root 'jobs#index'
end
