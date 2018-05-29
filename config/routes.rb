Rails.application.routes.draw do
  resources :plans
  get 'user-plans', to: 'plans#user_plans'
  resources :devos
  resources :topics
  resource :auth, only: %i[create]
end
