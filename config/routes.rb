Rails.application.routes.draw do
  resource :auth, only: %i[create]
end
