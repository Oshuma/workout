# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  root 'workouts#index'

  resources :routine_types
  resources :routines
  resources :workouts do
    resources :workout_sets
  end
end
