module ApplicationHelper
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
