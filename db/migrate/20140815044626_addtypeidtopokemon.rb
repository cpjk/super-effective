class Addtypeidtopokemon < ActiveRecord::Migration
  def change
    add_column :pokemon, :type_id, :integer
  end
end
