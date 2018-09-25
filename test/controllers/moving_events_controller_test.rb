require 'test_helper'

class MovingEventsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get moving_events_new_url
    assert_response :success
  end

  test "should get index" do
    get moving_events_index_url
    assert_response :success
  end

  test "should get edit" do
    get moving_events_edit_url
    assert_response :success
  end

  test "should get show" do
    get moving_events_show_url
    assert_response :success
  end

end
