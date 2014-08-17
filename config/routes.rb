Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.

  root 'battle#battle'

  get '/battle', to: 'battle#battle', as: :battle
  post '/battle', to: 'battle#add_pokemon', as: :add_pokemon
  delete '/battle', to: 'battle#delete_pokemon', as: :delete_pokemon
end
