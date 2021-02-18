require 'test_helper'

class Api::V1::ServerPackagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_server_packages_index_url
    assert_response :success
  end

  test "should get create" do
    get api_v1_server_packages_create_url
    assert_response :success
  end

end
