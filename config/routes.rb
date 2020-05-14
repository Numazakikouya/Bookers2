Rails.application.routes.draw do
	devise_for :users
  root 'homes#top'
  get 'home/about' => 'homes#about'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books, :only => [:index, :create, :show, :edit, :update, :destroy]
  resources :users, :only => [:index, :show, :create, :edit, :update]
end
