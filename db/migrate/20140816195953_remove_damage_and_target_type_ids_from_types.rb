class RemoveDamageAndTargetTypeIdsFromTypes < ActiveRecord::Migration
  def change
    remove_column :types, :damage_type_id
    remove_column :types, :target_type_id
  end
end
