class BattleController < ApplicationController
  before_filter :initialize_team

  def battle
  end

  def add_pokemon
    if session[:team].count >= 6
      flash[:error] = 'You already have a full team!'
      redirect_to battle_path and return
    end

    pokemon_name = params[:add_pokemon].downcase
    if Pokemon.find_by name: pokemon_name
      session[:team] << pokemon_name
    else
      flash[:error] = 'That is not a real pokemon!'
    end

    render 'battle'
  end

  def delete_pokemon
    session[:team].slice! session[:team].index(params[:pokemon])
    render 'battle'
  end

  private

  def initialize_team
    session[:team] ||= []
    @team = session[:team]
  end
end
