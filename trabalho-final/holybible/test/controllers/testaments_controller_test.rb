require 'test_helper'

class TestamentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @testament = testaments(:one)
  end

  test "should get index" do
    get testaments_url
    assert_response :success
  end

  test "should get new" do
    get new_testament_url
    assert_response :success
  end

  test "should create testament" do
    assert_difference('Testament.count') do
      post testaments_url, params: { testament: { name: @testament.name } }
    end

    assert_redirected_to testament_url(Testament.last)
  end

  test "should show testament" do
    get testament_url(@testament)
    assert_response :success
  end

  test "should get edit" do
    get edit_testament_url(@testament)
    assert_response :success
  end

  test "should update testament" do
    patch testament_url(@testament), params: { testament: { name: @testament.name } }
    assert_redirected_to testament_url(@testament)
  end

  test "should destroy testament" do
    assert_difference('Testament.count', -1) do
      delete testament_url(@testament)
    end

    assert_redirected_to testaments_url
  end
end
