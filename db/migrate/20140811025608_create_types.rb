class CreateTypes < ActiveRecord::Migration
  def change
    create_table :types do |t|
      t.string :name
      t.integer :pokedex_type_id
      t.integer :damage_type_id
      t.integer :target_type_id
    end
  end
end
