require 'test_helper'

class ServerPackagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get server_packages_index_url
    assert_response :success
  end

end
