require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  test "should render the index view withour a user" do
    get :index
    assert_response :success
  end

  test "should render the dashboard view with the angular template" do
    sign_in @user
    get :dashboard
    assert_template :dashboard
    assert_template layout: "layouts/angular"
  end

  test "should redirect from dashboard view to index without a user" do
    get :dashboard
    assert_response :redirect
  end

end
