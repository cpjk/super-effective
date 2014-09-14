Rails.application.routes.draw do
  root 'team#team'

  post '/team', to: 'team#add_pokemon', as: :add_pokemon
  get '/team', to: 'team#team', as: :team
  delete '/team', to: 'team#delete_pokemon', as: :delete_pokemon

  get '/battle', to: 'battle#battle', as: :battle
  post '/battle', to: 'battle#find_best_pokemon', as: :find_best_pokemon
end
