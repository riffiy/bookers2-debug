Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  
  resources :books, only: [:index,:show,:edit,:create,:destroy,:update]
  resources :users, only: [:index,:show,:edit,:update]
  
  root :to =>"homes#top"
  get "home/about"=>"homes#about"
  
  resources :books, only: [:new, :create, :index, :show, :destroy] do
    resource :favorites, only: [:create, :destroy]   
    resources :post_comments, only: [:create, :destroy]
  end
 
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
