Rails.application.routes.draw do
  
  devise_for :users
  # devise_for :users
  resources :projects 
  # 	resources :reviews
  # end
  root 'projects#index'
end
