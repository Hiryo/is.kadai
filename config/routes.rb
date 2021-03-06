Rails.application.routes.draw do
  root 'users#new'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show, :edit, :update]
  resources :favorites, only: [:index, :create, :destroy]
  resources :blogs do
    collection do
      post :confirm
    end
  end
end
