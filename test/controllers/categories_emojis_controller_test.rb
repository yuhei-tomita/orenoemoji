require 'test_helper'

class CategoriesEmojisControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get categories_emojis_create_url
    assert_response :success
  end

  test "should get destroy" do
    get categories_emojis_destroy_url
    assert_response :success
  end

end
