Rails.application.routes.draw do
  resources :plans
  get 'user-plans', to: 'plans#user_plans'
  resources :devos
  resources :topics
  post :login, to: 'login#auth'
  post :register, to: 'register#auth'
end
