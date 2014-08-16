require 'csv'

module Import
  class Pokedata

    def initialize path
      path = "/#{path}" if path[0] != '/'
      @path = Rails.root.to_s + path
    end

    def import!
      import_pokemon
      import_types
      import_type_effectiveness
    end

    def import_pokemon
      path = @path + '/pokemon.csv'
      CSV.foreach(path, headers: true) do |row|
        binding.pry
        pokemon = Pokemon.new
        pokemon.update pokedex_id: row["species_id"], name: row["identifier"]
      end
      # import pokemon
      # import pokemon types
    end

    def import_types
      path =@path + '/types.csv'
      CSV.foreach(path, headers: true) do |row|
        type = Type.new
        type.update name: row['identifier'], pokedex_type_id: row["id"]
      end
      # import types
      # import type_efficacy
    end

    def import_pokemon_types
    end

    def import_type_eff
      CSV.foreach(path, headers: true) do |row|
        #todo
      end
    end
  end
end
