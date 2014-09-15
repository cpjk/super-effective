class TeamController < ApplicationController
  before_filter :update_team, only: :team

  def team
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
    redirect_to :team
  end

  def delete_pokemon
    # remove pokemon passed in params from session[:team]
    session[:team].slice! session[:team].index(params[:pokemon])

    update_team
    redirect_to :back
  end

  private

  def update_team
    session[:team] ||= []
    @team = session[:team].map { |name| Pokemon.find_by name: name }
  end
end
