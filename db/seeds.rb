require 'json'
require 'open-uri'

Transaction.destroy_all
User.destroy_all
Pokemon.destroy_all

user1 = User.create(name: "Banque pokémon", email: "banque@mail.com", password: "123456")
user2 = User.create(name: "Toto", email: "toto@mail.com", password: "123456", balance: 50)

# Chargement du fichier JSON contenant les données des pokémons
file = File.read(Rails.root.join('db', 'pokemons.json'))
pokemons_data = JSON.parse(file)

# Boucle pour créer les enregistrements des pokémons
pokemons_data.each do |pokemon_data|
  pokemon = Pokemon.new(
    name: pokemon_data['name'],
    height: pokemon_data['height'],
    weight: pokemon_data['weight'],
    user: user1,
    price: rand(10..1000),
    tradable: true
  )
  image_url = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/#{pokemon_data['id']}.png"
  downloaded_image = URI.open(image_url)
  pokemon.image.attach(io: downloaded_image, filename: "#{pokemon.name}.png")
  pokemon.save!
  sleep(1)
end

puts "Les pokémons ont été créés dans la base de données avec les images attachées !"
