require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get user_new_url
    assert_response :success
  end

  test "should get createx" do
    get user_createx_url
    assert_response :success
  end

end
