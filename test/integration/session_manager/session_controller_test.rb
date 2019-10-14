require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get "/session_manager/sessions"
    assert_response :success
  end
end
