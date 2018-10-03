require 'test_helper'

class GiveawaysControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get giveaways_new_url
    assert_response :success
  end

  test "should get edit" do
    get giveaways_edit_url
    assert_response :success
  end

  test "should get index" do
    get giveaways_index_url
    assert_response :success
  end

  test "should get show" do
    get giveaways_show_url
    assert_response :success
  end

end
