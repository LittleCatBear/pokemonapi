# frozen_string_literal: true

require 'test_helper'

class GenerationTest < ActiveSupport::TestCase
  def setup
    @generation = Generation.new(number: 1)
  end

  test "should be valid" do
    assert @generation.valid?
  end

  test "valid? returns false if number is not present" do
    @generation.number = nil
    assert_not @generation.valid?
  end

  test "valid? returns false if number is not an integer" do
    @generation.number = 1.5
    assert_not @generation.valid?
  end

  test "valid? returns false if number is not positive" do
    @generation.number = -1
    assert_not @generation.valid?
  end

  test "valid? returns false if number is not unique" do
    duplicate_generation = @generation.dup
    @generation.save
    assert_not duplicate_generation.valid?
  end
end
