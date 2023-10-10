require "test_helper"

class LateNightIdeasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @late_night_idea = late_night_ideas(:one)
  end

  test "should get index" do
    get late_night_ideas_url, as: :json
    assert_response :success
  end

  test "should create late_night_idea" do
    assert_difference("LateNightIdea.count") do
      post late_night_ideas_url, params: { late_night_idea: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show late_night_idea" do
    get late_night_idea_url(@late_night_idea), as: :json
    assert_response :success
  end

  test "should update late_night_idea" do
    patch late_night_idea_url(@late_night_idea), params: { late_night_idea: {  } }, as: :json
    assert_response :success
  end

  test "should destroy late_night_idea" do
    assert_difference("LateNightIdea.count", -1) do
      delete late_night_idea_url(@late_night_idea), as: :json
    end

    assert_response :no_content
  end
end
