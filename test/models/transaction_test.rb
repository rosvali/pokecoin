require "test_helper"

class TransactionTest < ActiveSupport::TestCase
  test "valid transaction" do
    user = users(:user1)
    pokemon = pokemons(:pokemon1)
    transaction = Transaction.create(action: 0, user: user, pokemon: pokemon)
    
    assert transaction.valid?
  end

  test "transaction invalid user missing" do
    pokemon = pokemons(:pokemon1)
    transaction = Transaction.create(action: 0, pokemon: pokemon)
    
    refute transaction.valid?
  end

  test "transaction invalid pokemon missing" do
    user = users(:user1)
    transaction = Transaction.create(action: 0, user: user)
    
    refute transaction.valid?
  end

  test "transaction user and pokemon affiliation" do
    user = users(:user1)
    pokemon = pokemons(:pokemon1)
    transaction = Transaction.create(action: 0, user: user, pokemon: pokemon)
    
    assert_equal transaction.user.id, user.id
    assert_equal transaction.pokemon.id, pokemon.id
  end

  test "transaction action" do
    user = users(:user1)
    pokemon = pokemons(:pokemon1)
    transaction1 = Transaction.create(action: 0, user: user, pokemon: pokemon)
    transaction2 = Transaction.create(action: 1, user: user, pokemon: pokemon)
    
    assert_equal transaction1.action, "buy"
    assert_equal transaction2.action, "sell"
  end

  test "transaction modif method should return Achat or Vente" do
    user = users(:user1)
    pokemon = pokemons(:pokemon1)
    transaction1 = Transaction.create(action: 0, user: user, pokemon: pokemon)
    transaction2 = Transaction.create(action: 1, user: user, pokemon: pokemon)
    
    assert_equal transaction1.motif, "Achat"
    assert_equal transaction2.motif, "Vente"
  end
end
