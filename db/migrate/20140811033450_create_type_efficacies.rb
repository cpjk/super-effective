class CreateTypeEfficacies < ActiveRecord::Migration
  def change
    create_table :type_efficacies do |t|
      t.belongs_to :type
      t.integer :target_type_id
      t.integer :damage_type_id
      # type_efficacies have target type and damage_type, which each refer to types through a foreign key --> target_type_id and damage_type_id
    end
  end
end
