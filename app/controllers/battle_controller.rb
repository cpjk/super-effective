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
    redirect_to :battle
  end

  def delete_pokemon
    # remove pokemon passed in params from session[:team]
    session[:team].slice! session[:team].index(params[:pokemon])

    update_team
    redirect_to :battle
  end

  private

  def update_team
    session[:team] ||= []
    @team = session[:team].map { |name| Pokemon.find_by name: name }
  end

  def best_pokemon enemy_name
    enemy = Pokemon.find_by name: enemy_name
    first_enemy_type = enemy.types.first
    second_enemy_type = enemy.types.second

    @team.sort_by do |member|
      first_member_type = member.types.first
      second_member_type = member.types.second

      [first_member_type.damage_factor_as_damager_vs(first_enemy_type),
       -first_enemy_type.damage_factor_as_damager_vs(first_member_type)]
    end
  end
end
