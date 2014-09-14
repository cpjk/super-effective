class BattleController < ApplicationController
  before_filter :get_team

  def battle
  end

  def find_best_pokemon
    if enemy = Pokemon.find_by(name: params[:enemy].downcase)
      @best_pokemon = best_pokemon @team, enemy
    else
      flash[:error] = "That is not a real pokemon!"
    end
    render :battle
  end

  def get_team
    @team = session[:team].map { |name| Pokemon.find_by name: name }
  end

  private

  def best_pokemon team, enemy
    first_enemy_type = enemy.types.first
    second_enemy_type = enemy.types.second

    @team.sort_by do |member|
      first_member_type = member.types.first
      second_member_type = member.types.second

      [first_member_type.damage_factor_as_damager_vs(first_enemy_type),
       -first_enemy_type.damage_factor_as_damager_vs(first_member_type)]
    end.first
  end
end
