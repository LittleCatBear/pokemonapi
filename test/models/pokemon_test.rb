# frozen_string_literal: true

require 'test_helper'

class PokemonTest < ActiveSupport::TestCase
  def setup
    @type1 = Type.create(name: 'Fire')
    @type2 = Type.create(name: 'Water')
    @generation = Generation.create(number: 1)
    @pokemon = Pokemon.new(
      number: 1,
      name: 'Bulbasaur',
      hp: 45,
      attack: 49,
      defense: 49,
      sp_atk: 65,
      sp_def: 65,
      speed: 45,
      type1: @type1,
      type2: @type2,
      generation: @generation,
      legendary: false
    )
  end

  test "should be valid" do
    assert @pokemon.valid?
  end

  test "should be valid without a type2" do
    @pokemon.type2 = nil
    assert @pokemon.valid?
  end

  test "valid? returns false if name is not present" do
    @pokemon.name = nil
    assert_not @pokemon.valid?
  end

  test "valid? returns false if name is not unique" do
    duplicate_pokemon = @pokemon.dup
    @pokemon.save
    assert_not duplicate_pokemon.valid?
  end

  test "valid? returns false if total is not correctly calculated" do
    @pokemon.save!
    assert_equal @pokemon.total, @pokemon.hp + @pokemon.attack + @pokemon.defense + @pokemon.sp_atk + @pokemon.sp_def + @pokemon.speed
  end

  test "valid? returns false if type1 is missing" do
    @pokemon.type1 = nil
    assert_not @pokemon.valid?
  end

  test "valid? returns false if generation is missing" do
    @pokemon.generation = nil
    assert_not @pokemon.valid?
  end
end
