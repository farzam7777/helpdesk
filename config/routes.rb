Rails.application.routes.draw do

  resources :pages do
  	collection do
  		get 'complete_profile'
  	end
  end

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  root 'pages#index'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", :registrations => "registrations"}

  resources :categories
end
