# frozen_string_literal: true

require 'test_helper'

class GenerationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @generation = Generation.create!(number: 1)
  end

  test "#index should be successful" do
    get generations_url, as: :json
    assert_response :success
  end

  test "#create should create a new generation" do
    assert_difference('Generation.count') do
      post generations_url, params: { generation: { number: 2 } }, as: :json
    end

    assert_response 201
  end

  test "#show should show the selected generation" do
    get generation_url(@generation), as: :json
    assert_response :success
  end

  test "#update should update the selected generation" do
    patch generation_url(@generation), params: { generation: { number: 3 } }, as: :json
    assert_response 200
  end

  test "#destroy should destroy the selected generation" do
    assert_difference('Generation.count', -1) do
      delete generation_url(@generation), as: :json
    end

    assert_response 204
  end
end
