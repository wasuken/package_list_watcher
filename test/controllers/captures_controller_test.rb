require 'test_helper'

class CapturesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get captures_index_url
    assert_response :success
  end

  test "should get create" do
    get captures_create_url
    assert_response :success
  end

end
