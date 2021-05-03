Rails.application.routes.draw do

  devise_for :users
  root to: 'diaries#index'

  resources :diaries, only: [:index, :new, :create, :show] do
    collection do
      get 'how_to_use'
    end
  end

  resources :points, only: :index
  resources :feeds, only: [:new, :create]
end
