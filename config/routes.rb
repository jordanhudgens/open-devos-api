Rails.application.routes.draw do
  resources :plans
  resources :devos
  resources :topics
  resource :auth, only: %i[create]
end
