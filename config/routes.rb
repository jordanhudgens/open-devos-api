Rails.application.routes.draw do
  resources :bookmarks, except: [:show, :update]
  resources :random_plans, only: [:index]
  resources :devo_positions, only: [:update]
  resources :plans
  get 'user-plans', to: 'plans#user_plans'
  resources :devos
  resources :topics
  resources :plan_assignments, only: [:create, :index, :update]
  resources :devo_completions, only: [:create, :index, :destroy]
  get 'last-plan', to: 'plan_assignments#last_plan'
  get 'profile/:user_slug', to: 'users#profile'
  get :search, to: 'search#search'
  post :login, to: 'auths#login'
  post :register, to: 'auths#register'
  get :logged_in, to: 'auths#logged_in'
end
