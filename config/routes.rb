Rails.application.routes.draw do

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  get '/yarns/:yarn_id', to: 'yarns#show'

  get '/knots', to: 'knots#index'

  root to: 'knots#new'

end
