# frozen_string_literal: true

require 'test_helper'

class TypeTest < ActiveSupport::TestCase
  def setup
    @type = Type.new(name: "Fire")
  end

  test "should be valid" do
    assert @type.valid?
  end

  test "valid? returns false if name is not present" do
    @type.name = ""
    assert_not @type.valid?
  end

  test "valid? returns false if name is too long" do
    @type.name = "a" * 101
    assert_not @type.valid?
  end

  test "valid? returns false if name is not unique" do
    duplicate_type = @type.dup
    @type.save
    assert_not duplicate_type.valid?
  end
end