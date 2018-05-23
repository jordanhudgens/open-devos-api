Rails.application.routes.draw do
  resources :devos
  resources :topics
  resource :auth, only: %i[create]
end
