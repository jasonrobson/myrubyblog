Rails.application.routes.draw do
  get 'pages/about', :to => 'pages#about'
  get 'pages/contact', :to => 'pages#contact'
  get 'pages/resources', :to => 'pages#resources'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  #get 'home/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root :to => 'home#index'

  resources :posts, :categories
end
