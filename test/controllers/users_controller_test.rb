require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get sessions" do
    get users_sessions_url
    assert_response :success
  end

  test "should get posts" do
    get users_posts_url
    assert_response :success
  end

  test "should get home" do
    get users_home_url
    assert_response :success
  end

  test "should get comments" do
    get users_comments_url
    assert_response :success
  end

end
