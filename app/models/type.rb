class Type < ActiveRecord::Base
  has_many :pokemon, through: :pokemon_types
  has_many :pokemon_types
  has_many :damage_type_efficacies, class_name: 'TypeEfficacy', foreign_key: :damage_type_id # when the type is damage type. migration needed
  has_many :target_type_efficacies, class_name: 'TypeEfficacy', foreign_key: :target_type_id # when the type is the target type. migration needed
end
