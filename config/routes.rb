Rails.application.routes.draw do
	devise_for :users
  root 'homes#top'
  get 'homes/about' => 'homes#about'
	resources :users, :only => [:index, :show, :create, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books, :only => [:index, :create, :show, :edit, :update, :destroy] do
  	resource :favorites, :only => [:create, :destroy]
  	end
  resource :book_comments, :only => [:create, :destroy]

end
