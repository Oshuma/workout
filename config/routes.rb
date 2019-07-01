# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  root 'workouts#index'

  resources :workouts do
    get :import, on: :collection
    post :upload, on: :collection
  end
end
