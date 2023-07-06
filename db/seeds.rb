# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Transaction.destroy_all
User.destroy_all
Pokemon.destroy_all

user1 = User.create(name: "Toto", email: "Toto@mail.com", password: "123456", balance: 100)
user2 = User.create(name: "Rosa", email: "Rosa@mail.com", password: "123456", balance: 30)

bulbizarre = Pokemon.create(name: "Bulbizarre", weigth: 7, height: 1, price: 10, user: user1)
salameche = Pokemon.create(name: "Salamèche", weigth: 8, height: 1, price: 20, user: user1)
carapuce = Pokemon.create(name: "Carapuce", weigth: 9, height: 1, price: 30, user: user1)
chenipan = Pokemon.create(name: "Chenipan", weigth: 3, height: 0, price: 40, user: user2)
rattata = Pokemon.create(name: "Rattata", weigth: 3, height: 0, price: 50, user: user2)
piafabec = Pokemon.create(name: "Piafabec", weigth: 2, height: 0, price: 60, user: user2)
pikachu = Pokemon.create(name: "Pikachu", weigth: 6, height: 0, price: 70, user: user2)

bulbizarre.image.attach(io: File.open(File.join(Rails.root,'app/assets/images/bulbizarre.png')),filename: 'bulbizarre.png')
salameche.image.attach(io: File.open(File.join(Rails.root,'app/assets/images/salameche.png')),filename: 'salameche.png')
carapuce.image.attach(io: File.open(File.join(Rails.root,'app/assets/images/carapuce.png')),filename: 'carapuce.png')
chenipan.image.attach(io: File.open(File.join(Rails.root,'app/assets/images/chenipan.png')),filename: 'chenipan.png')
rattata.image.attach(io: File.open(File.join(Rails.root,'app/assets/images/rattata.png')),filename: 'rattata.png')
piafabec.image.attach(io: File.open(File.join(Rails.root,'app/assets/images/piafabec.png')),filename: 'piafabec.png')
pikachu.image.attach(io: File.open(File.join(Rails.root,'app/assets/images/pikatchu.png')),filename: 'pikatchu.png')
