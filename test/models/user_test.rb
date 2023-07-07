require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "valid user" do 
    user = User.create(name: "user1", email: "user1@mail.com", 
      password: "123456")
    assert user.valid?
  end

  test "invalid user: name missing" do
    user = User.create(email: "user2@mail.com", password: "123456")
    refute user.valid?
  end

  test "has many pokemons" do
    user = users(:user1)
    assert user.pokemons.empty?

    pokemons(:pokemon1).update(user: user)
    refute user.pokemons.empty?
    assert_equal pokemons(:pokemon1).name, user.pokemons.first.name
  end

  test "has many transactions" do
    user = users(:user1)
    pokemon = pokemons(:pokemon1)
    assert user.transactions.empty?
    
    transactions(:buy_transaction).update(user: user, pokemon: pokemon)
    refute user.transactions.empty?
  end
end
