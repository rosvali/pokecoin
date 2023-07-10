require "test_helper"

class PokemonsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  fixtures :pokemons

  setup do
    @pokemon = pokemons(:pokemon1)
  end

  teardown do
    Rails.cache.clear
  end

  test "should get index" do
    get pokemons_url
    assert_response :success
  end
  
  test "should get show" do
    sign_in users(:user1)
    get pokemon_url(@pokemon.id)
    assert_response :success
  end

  test "shouldn't get show without user logged" do
    get pokemon_url(@pokemon.id)
    assert_response :redirect
  end

  test "shouldn't update pokemon without user logged" do
    put pokemon_url(@pokemon.id)
    assert_response :redirect
  end

  test "user can update tradable" do
    sign_in users(:user1)
    initial_tradable = @pokemon.tradable
    put pokemon_url(@pokemon.id)
    @pokemon.reload

    assert_response :success
    assert_not_equal initial_tradable, @pokemon.tradable
  end

  test "should get checkout" do
    sign_in users(:user1)
    get pokemon_checkout_url(@pokemon.id)
    
    assert_response :success
  end

  test "should'nt get checkout" do
    get pokemon_checkout_url(@pokemon.id)
    
    assert_response :redirect
  end

  test "should buy a pokemon" do
    sign_in users(:user1)
    pokemon = pokemons(:pokemon2)
    user_id = pokemon.user.id
    post pokemon_buy_url(pokemon.id)
    pokemon.reload
    
    
    assert_response :redirect
    assert_not_equal user_id, pokemon.user.id
  end

  test "balance is updated after sell" do
    current_user = users(:user1)
    sign_in current_user
    pokemon = pokemons(:pokemon2)
    initial_balance_buyer = current_user.balance
    initial_balance_seller = pokemon.user.balance
    price = pokemon.price
    seller = pokemon.user

    post pokemon_buy_url(pokemon.id)
    pokemon.reload
    seller.reload

    assert_equal initial_balance_buyer - price, pokemon.user.balance
    assert_equal initial_balance_seller + price, seller.balance
  end

  test "create transactions during a sell" do
    sign_in users(:user1)
    pokemon = pokemons(:pokemon2)
    seller = pokemon.user.id
    post pokemon_buy_url(pokemon.id)
    pokemon.reload

    assert Transaction.find_by(user: pokemon.user, pokemon: pokemon, action: 0)
    assert Transaction.find_by(user: seller, pokemon: pokemon, action: 1)
  end

  test "tradable is set to false after sell" do
    sign_in users(:user1)
    pokemon = pokemons(:pokemon2)
    pokemon.update(tradable: true)
    post pokemon_buy_url(pokemon.id)
    pokemon.reload

    assert_equal pokemon.tradable, false
  end

  test "should'nt buy a pokemon if user is vendor" do
    sign_in users(:user1)
    pokemon = pokemons(:pokemon1)
    post pokemon_buy_url(pokemon.id)
    pokemon.reload

    assert_response :error
  end

  test "should'nt buy a pokemon if user doesn't have enough balance" do
    sign_in users(:user2)
    pokemon = pokemons(:pokemon1)

    post pokemon_buy_url(pokemon.id)
    pokemon.reload

    assert_response :error
  end
end
