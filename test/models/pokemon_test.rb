require "test_helper"

class PokemonTest < ActiveSupport::TestCase
  test "pokemon valid" do
    user = users(:user1)
    pokemon = Pokemon.create(name: "Pikachu", weight: 5, height: 5, price: 30, user: user)
    assert pokemon.valid?
  end

  test "pokemon invalid: user missing" do
    refute pokemons(:pokemon1).valid?
  end

  test "pokemon user associations" do
    pokemon = pokemons(:pokemon1)
    refute pokemon.user
    pokemon.update(user: users(:user1))
    assert pokemon.user
  end

  test "pokemon has many transactions" do
    pokemon = pokemons(:pokemon1)
    user = users(:user1)
    assert pokemon.transactions.empty?
    
    transactions(:buy_transaction).update(pokemon: pokemon, user: user)
    refute pokemon.transactions.empty?
  end

  test "should attach an image and purge it when destroyed" do
    pokemon = Pokemon.new(name: "Pikachu")
    pokemon.image.attach(io: File.open(Rails.root.join('test/fixtures/files/pikachu.png')), filename: 'pikachu.png', content_type: 'image/png')

    assert pokemon.image.attached?
    assert_not ActiveStorage::Attachment.exists?(pokemon.image.attachment.id)
  end
end
