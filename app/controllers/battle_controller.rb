class BattleController < ApplicationController
  before_filter :update_team, only: :battle

  def battle
  end

  def add_pokemon
    if session[:team].count >= 6
      flash[:error] = 'You already have a full team!'
    else
      pokemon_name = params[:add_pokemon].downcase
      if Pokemon.find_by name: pokemon_name
        session[:team] << pokemon_name
      else
        flash[:error] = 'That is not a real pokemon!'
      end
    end
    update_team
    render 'battle'
  end

  def delete_pokemon
    # remove pokemon passed in params from session[:team]
    session[:team].slice! session[:team].index(params[:pokemon])

    update_team
    render 'battle'
  end

  private

  def update_team
    session[:team] ||= []
    @team = session[:team].map { |name| Pokemon.find_by name: name }
  end
end
