require 'csv'

module Import
  class Pokedata

    def initialize
    end

    def import
      import_pokemon
      import_types
      import_pokemon_types
      import_type_efficacies
    end

    def import_pokemon options = { path: 'data/csv/pokemon.csv' }
      CSV.foreach(Rails.root + options[:path], headers: true) do |row|
        ActiveRecord::Base.transaction do
          unless row['identifier'].nil?
            Pokemon.create(pokedex_id: row["species_id"], name: row["identifier"])
          end
        end
      end
    end

    def import_types options = { path: 'data/csv/types.csv' }
      CSV.foreach(Rails.root + options[:path], headers: true) do |row|
        ActiveRecord::Base.transaction do
          unless row['identifier'].nil?
            Type.create(name: row['identifier'], pokedex_type_id: row['id'])
          end
        end
      end
    end

    def import_pokemon_types options = { path: 'data/csv/pokemon_types.csv' }
      CSV.foreach(Rails.root + options[:path], headers: true) do |row|
        ActiveRecord::Base.transaction do
          unless row['pokemon_id'].nil?
            type = Type.find_by pokedex_type_id: row['type_id']
            pokemon = Pokemon.find_by pokedex_id: row['pokemon_id']
            pokemon.types << type unless pokemon.types.include? type
          end
        end
      end
    end

    def import_type_efficacies options = { path: 'data/csv/type_efficacy.csv' }
      CSV.foreach(Rails.root + options[:path], headers: true) do |row|
        ActiveRecord::Base.transaction do
          unless row['damage_type_id'].nil?
            target_type_id = row['target_type_id']
            damage_type_id = row['damage_type_id']
            type_efficacy = TypeEfficacy.create damage_factor: row['damage_factor']
            Type.find_by(pokedex_type_id: target_type_id).target_type_efficacies << type_efficacy
            Type.find_by(pokedex_type_id: damage_type_id).damage_type_efficacies << type_efficacy
          end
        end
      end
    end
  end
end
