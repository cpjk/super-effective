class CreatePokemonTypes < ActiveRecord::Migration
  def change
    create_table :pokemon_types do |t|
      t.belongs_to :pokemon
      t.belongs_to :type
    end
  end
end
