require 'test_helper'

class SolvingsControllerTest < ActionController::TestCase
  setup do
    @solving = solvings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:solvings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create solving" do
    assert_difference('Solving.count') do
      post :create, :solving => @solving.attributes
    end

    assert_redirected_to solving_path(assigns(:solving))
  end

  test "should show solving" do
    get :show, :id => @solving.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @solving.to_param
    assert_response :success
  end

  test "should update solving" do
    put :update, :id => @solving.to_param, :solving => @solving.attributes
    assert_redirected_to solving_path(assigns(:solving))
  end

  test "should destroy solving" do
    assert_difference('Solving.count', -1) do
      delete :destroy, :id => @solving.to_param
    end

    assert_redirected_to solvings_path
  end
end
