require 'test_helper'

class MoveesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get movees_new_url
    assert_response :success
  end

  test "should get edit" do
    get movees_edit_url
    assert_response :success
  end

  test "should get show" do
    get movees_show_url
    assert_response :success
  end

  test "should get index" do
    get movees_index_url
    assert_response :success
  end

end
