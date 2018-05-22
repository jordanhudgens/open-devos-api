Rails.application.routes.draw do
  resources :topics
  resource :auth, only: %i[create]
end
