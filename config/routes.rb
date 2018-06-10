Rails.application.routes.draw do
  resources :plans
  get 'user-plans', to: 'plans#user_plans'
  resources :devos
  resources :topics
  get :profile, to: 'users#profile'
  get :search, to: 'search#search'
  post :login, to: 'auths#login'
  post :register, to: 'auths#register'
end
