class CreatePokemon < ActiveRecord::Migration
  def change
    create_table :pokemon do |t|
      t.string :name
      t.integer :pokedex_id
    end
  end
end
