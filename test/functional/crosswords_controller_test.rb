require 'test_helper'

class CrosswordsControllerTest < ActionController::TestCase
  setup do
    @crossword = crosswords(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:crosswords)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create crossword" do
    assert_difference('Crossword.count') do
      post :create, :crossword => @crossword.attributes
    end

    assert_redirected_to crossword_path(assigns(:crossword))
  end

  test "should show crossword" do
    get :show, :id => @crossword.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @crossword.to_param
    assert_response :success
  end

  test "should update crossword" do
    put :update, :id => @crossword.to_param, :crossword => @crossword.attributes
    assert_redirected_to crossword_path(assigns(:crossword))
  end

  test "should destroy crossword" do
    assert_difference('Crossword.count', -1) do
      delete :destroy, :id => @crossword.to_param
    end

    assert_redirected_to crosswords_path
  end
end
