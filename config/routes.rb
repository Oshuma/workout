# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  root 'workouts#index'

  devise_for :users

  resources :routine_types
  resources :settings, only: [:index, :update]

  resources :workouts do
    resources :routines
    get :graphs, on: :collection
  end
end
