# frozen_string_literal: true

require 'test_helper'

class PokemonsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @type1 = Type.create!(name: "plant")
    @type2 = Type.create!(name: "fire")
    @generation = Generation.create!(number: 1)
    @pokemon = Pokemon.create!(
      number: 1,
      name: "Bulbizarre",
      hp: 1,
      attack: 2,
      defense: 3,
      sp_atk: 4,
      sp_def: 5,
      speed: 6,
      type1: @type1,
      type2: @type2,
      generation: @generation
    )
  end

  test "#index should be successful" do
    get pokemons_url, as: :json
    assert_response :success
  end

  test "#create should create a pokemon" do
    assert_difference('Pokemon.count') do
      post pokemons_url, params: {
        pokemon: {
          number: 2,
          name: "Carapuce",
          hp: @pokemon.hp,
          attack: @pokemon.attack,
          defense: @pokemon.defense,
          sp_atk: @pokemon.sp_atk,
          sp_def: @pokemon.sp_def,
          speed: @pokemon.speed,
          type1_id: @type1.id,
          type2_id: @type2.id,
          generation_id: @generation.id
        }
      }, as: :json
    end

    assert_response 201
  end

  test "#create should create a pokemon and associated types and generations if they don't exist" do
    assert_difference('Pokemon.count') do
      post pokemons_url, params: {
        pokemon: {
          number: 987,
          name: "Grisouillette",
          hp: @pokemon.hp,
          attack: @pokemon.attack,
          defense: @pokemon.defense,
          sp_atk: @pokemon.sp_atk,
          sp_def: @pokemon.sp_def,
          speed: @pokemon.speed,
          type1_attributes: { name: "cat" },
          type2_attributes: { name: "fluffy" },
          generation_attributes: { number: 111 }
        }
      }, as: :json
    end

    assert_response 201
  end

  test "#show should show selected pokemon" do
    get pokemon_url(@pokemon), as: :json
    assert_response :success
  end

  test "#update should update specific pokemon" do
    patch pokemon_url(@pokemon), params: {
      pokemon: {
        number: 45,
        name: "Florizarre",
        hp: @pokemon.hp + 1,
        attack: @pokemon.attack + 2,
        defense: @pokemon.defense + 3,
        sp_atk: @pokemon.sp_atk + 4,
        sp_def: @pokemon.sp_def + 5,
        speed: @pokemon.speed + 6,
        legendary: true,
        type1_attributes: { name: "new type" },
        type2_attributes: nil,
        generation_attributes: { number: 23 }
      }
    }, as: :json
    assert_response 200
  end

  test "#destroy should destroy the specified pokemon" do
    assert_difference('Pokemon.count', -1) do
      delete pokemon_url(@pokemon), as: :json
    end

    assert_response 204
  end
end
