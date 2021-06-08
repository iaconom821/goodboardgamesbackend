require "test_helper"

class BoardgamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @boardgame = boardgames(:one)
  end

  test "should get index" do
    get boardgames_url, as: :json
    assert_response :success
  end

  test "should create boardgame" do
    assert_difference('Boardgame.count') do
      post boardgames_url, params: { boardgame: { description: @boardgame.description, manufacturer: @boardgame.manufacturer, title: @boardgame.title } }, as: :json
    end

    assert_response 201
  end

  test "should show boardgame" do
    get boardgame_url(@boardgame), as: :json
    assert_response :success
  end

  test "should update boardgame" do
    patch boardgame_url(@boardgame), params: { boardgame: { description: @boardgame.description, manufacturer: @boardgame.manufacturer, title: @boardgame.title } }, as: :json
    assert_response 200
  end

  test "should destroy boardgame" do
    assert_difference('Boardgame.count', -1) do
      delete boardgame_url(@boardgame), as: :json
    end

    assert_response 204
  end
end
