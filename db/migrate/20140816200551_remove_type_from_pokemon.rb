class RemoveTypeFromPokemon < ActiveRecord::Migration
  def change
    remove_column :pokemon, :type_id
  end
end
