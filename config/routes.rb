Rails.application.routes.draw do

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/qwer', to: 'sessions#backdoor'

  get '/yarns/:yarn_id', to: 'yarns#show'
  post '/yarns', to: 'yarns#create'

  resources :knots
  get '/knots/:id/done', to: 'knots#done'

  root to: 'knots#new'

end
