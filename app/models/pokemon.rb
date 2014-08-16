class Pokemon < ActiveRecord::Base
  has_many :types, through: :pokemon_types
  has_many :pokemon_types
end
