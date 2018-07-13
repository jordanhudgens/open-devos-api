Rails.application.routes.draw do
  resources :plans
  get 'user-plans', to: 'plans#user_plans'
  resources :devos
  resources :topics
  resources :plan_assignments, only: [:create, :index, :update]
  get 'profile/:user_slug', to: 'users#profile'
  get :search, to: 'search#search'
  post :login, to: 'auths#login'
  post :register, to: 'auths#register'
end
