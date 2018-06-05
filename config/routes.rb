Rails.application.routes.draw do
  resources :plans
  get 'user-plans', to: 'plans#user_plans'
  resources :devos
  resources :topics
  post :login, to: 'auth#login'
  post :register, to: 'auth#register'
end
