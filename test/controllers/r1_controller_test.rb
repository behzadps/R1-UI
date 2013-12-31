require 'test_helper'

class R1ControllerTest < ActionController::TestCase
  test "should get form1" do
    get :form1
    assert_response :success
  end

  test "should get noofUniqs" do
    get :noofUniqs
    assert_response :success
  end

end
