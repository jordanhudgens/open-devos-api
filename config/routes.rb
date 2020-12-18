Rails.application.routes.draw do
  get '/popular', to: 'popular#index'
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
  resources :users, only: [:update]
  get :search, to: 'search#search'
  resources :authors, only: [:index]
  resources :registrations, only: [:create]
  resources :sessions, only: [:create]
  delete :logout, to: 'sessions#logout'
  get :logged_in, to: 'sessions#logged_in'

  namespace :mobile do
    resource :profile, only: [:show]
    post 'user_token' => 'user_token#create'
    resources :users
  end

  root to: "pages#home"
end
