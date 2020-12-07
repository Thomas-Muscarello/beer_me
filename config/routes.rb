Rails.application.routes.draw do

#Scope Route
  get 'beers/abv_rating_higher_than_5', to: 'beers#high_abv', as: "abv_higher_than_5"
#Nested Route
  resources :beers do
    resources :posts
  end

#User Resources
  resources :users, only: [:new, :create, :show]

  
# Custom routes for session login form, login creation, and logout
  get '/login', to: 'sessions#login', as: 'login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#logout', as: 'logout'

#Omni Auth
  get '/auth/google_oauth2/callback', to: 'sessions#google_login'

end
