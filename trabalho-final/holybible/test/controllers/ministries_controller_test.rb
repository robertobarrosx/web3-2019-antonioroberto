require 'test_helper'

class MinistriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ministry = ministries(:one)
  end

  test "should get index" do
    get ministries_url
    assert_response :success
  end

  test "should get new" do
    get new_ministry_url
    assert_response :success
  end

  test "should create ministry" do
    assert_difference('Ministry.count') do
      post ministries_url, params: { ministry: { church_id: @ministry.church_id, date: @ministry.date, description: @ministry.description, picture: @ministry.picture, text: @ministry.text, title: @ministry.title, user_id: @ministry.user_id } }
    end

    assert_redirected_to ministry_url(Ministry.last)
  end

  test "should show ministry" do
    get ministry_url(@ministry)
    assert_response :success
  end

  test "should get edit" do
    get edit_ministry_url(@ministry)
    assert_response :success
  end

  test "should update ministry" do
    patch ministry_url(@ministry), params: { ministry: { church_id: @ministry.church_id, date: @ministry.date, description: @ministry.description, picture: @ministry.picture, text: @ministry.text, title: @ministry.title, user_id: @ministry.user_id } }
    assert_redirected_to ministry_url(@ministry)
  end

  test "should destroy ministry" do
    assert_difference('Ministry.count', -1) do
      delete ministry_url(@ministry)
    end

    assert_redirected_to ministries_url
  end
end
