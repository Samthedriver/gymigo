Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  get '/users/:id/reviews', to: 'users#reviews', as: :reviews

  resources :amigo_reviews

  resources :workouts
  get '/join_workout', to: 'workouts#join_workout', as: :join_workout
  post '/book_workout/:id', to: 'workouts#book_workout', as: :book_workout
  get '/upcoming', to: 'workouts#upcoming', as: :upcoming
  get '/menu', to: 'workouts#menu', as: :menu
  post '/complete_workout/:id', to: 'workouts#complete_workout', as: :complete_workout
  get '/completed', to: 'workouts#completed', as: :completed
  get '/awaiting', to: 'workouts#awaiting', as: :awaiting

  resources :gyms, only: [:index, :show]
  get '/search', to: 'gyms#search'

  get '/gym_show_reviews/:id', to: 'gyms#gym_show_reviews', as: :gym_show_reviews

  resources :gym_reviews


  get '/', to: 'application#welcome'
  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  post '/logout',  to: 'sessions#destroy'
  get '/users/:id/profile', to: 'users#profile', as: :profile

end
