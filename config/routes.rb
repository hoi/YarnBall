Rails.application.routes.draw do

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  get '/yarns/:yarn_id', to: 'yarns#show'
  post '/yarns', to: 'yarns#create'

  get '/knots', to: 'knots#index'
  post '/knots', to: 'knots#create'

  root to: 'knots#new'

end
