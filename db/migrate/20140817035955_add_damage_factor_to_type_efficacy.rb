class AddDamageFactorToTypeEfficacy < ActiveRecord::Migration
  def change
    add_column :type_efficacies, :damage_factor, :integer
  end
end
