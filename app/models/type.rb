class Type < ActiveRecord::Base
  has_many :pokemon, through: :pokemon_types
  has_many :pokemon_types
  has_many :damage_type_efficacies, class_name: 'TypeEfficacy', foreign_key: :damage_type_id # when the type is damage type
  has_many :target_type_efficacies, class_name: 'TypeEfficacy', foreign_key: :target_type_id # when the type is the target type

  def damage_factor_vs type = nil
    self.damage_type_efficacies.find_by(target_type: type).damage_factor
  end
end
