Rails.application.routes.draw do
  get 'contacts/name:string'
  get 'contacts/email:string'
  get 'contacts/content:text'
  root 'users#new'
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]
  resources :favorites, only: [:index, :create, :destroy]
  resources :blogs do
    collection do
      post :confirm
    end
  end
end
