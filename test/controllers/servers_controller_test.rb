require 'test_helper'

class ServersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get servers_index_url
    assert_response :success
  end

  test "should get create" do
    get servers_create_url
    assert_response :success
  end

end
