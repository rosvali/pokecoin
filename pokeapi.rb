require 'net/http'
require 'json'

# URL de l'API PokeAPI pour obtenir les informations des pokémons
base_url = "https://pokeapi.co/api/v2/pokemon/"

# Nombre total de pokémons à récupérer
num_pokemons = 151

# Tableau pour stocker les informations des pokémons
pokemons = []

# Boucle pour récupérer les informations de chaque pokémon
for i in 1..num_pokemons
  url = URI.parse(base_url + i.to_s)
  response = Net::HTTP.get_response(url)

  if response.is_a?(Net::HTTPSuccess)
    pokemon_data = JSON.parse(response.body)
    pokemon_info = {
      id: pokemon_data['id'],
      name: pokemon_data['name'],
      height: pokemon_data['height'],
      weight: pokemon_data['weight'],
    }
    pokemons << pokemon_info
    puts "Récupération des données du pokémon #{i}/#{num_pokemons}"
  else
    puts "Échec de la requête pour le pokémon #{i}"
  end
end

# Enregistrement des données dans un fichier JSON
File.open("pokemons.json", "w") do |file|
  file.write(JSON.pretty_generate(pokemons))
end

puts "Terminé ! Les données des pokémons ont été enregistrées dans le fichier 'pokemons.json'."
