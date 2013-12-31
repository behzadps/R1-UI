require 'test_helper'

class BreakdownControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
