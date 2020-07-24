Rails.application.routes.draw do
  resources :cases, only: [:index, :show, :create, :update]

  post '/login', to: 'doctors#login'
  get '/validate', to: 'doctors#validate'

end

