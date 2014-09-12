Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.

  root 'team#team'

  post '/team', to: 'team#add_pokemon', as: :add_pokemon
  get '/team', to: 'team#team', as: :team
  delete '/team', to: 'team#delete_pokemon', as: :delete_pokemon
end
