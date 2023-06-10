# frozen_string_literal: true

require 'test_helper'

class TypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @type = Type.create!(name: "water")
  end

  test "#index should be successful" do
    get types_url, as: :json
    assert_response :success
  end

  test "#create should create a new type" do
    assert_difference('Type.count') do
      post types_url, params: { type: { name: 'Grass' } }, as: :json
    end

    assert_response 201
  end

  test "#show should show the selected type" do
    get type_url(@type), as: :json
    assert_response :success
  end

  test "#update should update the selected type" do
    patch type_url(@type), params: { type: { name: 'Electric' } }, as: :json
    assert_response 200
  end

  test "#destroy should destroy the selected type" do
    assert_difference('Type.count', -1) do
      delete type_url(@type), as: :json
    end

    assert_response 204
  end
end
