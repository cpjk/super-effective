class Deletetypeidfromtypeefficacies < ActiveRecord::Migration
  def change
    remove_column :type_efficacies, :type_id
  end
end
