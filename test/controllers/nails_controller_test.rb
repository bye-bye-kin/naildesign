require 'test_helper'

class RecipesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get nails_index_url
    assert_response :success
  end

  test "should get show" do
    get nails_show_url
    assert_response :success
  end

  test "should get new" do
    get nails_new_url
    assert_response :success
  end

  test "should get edit" do
    get nails_edit_url
    assert_response :success
  end

end
