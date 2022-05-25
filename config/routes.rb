Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#index"

  resources :people, only: [:create, :show, :index] do
    resources :party, only: [:new, :create]
  end

  get "/discover", to: "movies#discover", as: "discover"
  get "/discover/movies", to: 'people_movies#show', as: "movie_show"
  get "/register", to: "people#new", as: "register"

  resources :movies, only: [:index, :show]
end
