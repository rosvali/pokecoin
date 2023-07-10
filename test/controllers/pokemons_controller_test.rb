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
end
