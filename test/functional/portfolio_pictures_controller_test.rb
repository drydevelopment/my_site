require 'test_helper'

class PortfolioPicturesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:portfolio_pictures)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create portfolio_picture" do
    assert_difference('PortfolioPicture.count') do
      post :create, :portfolio_picture => { }
    end

    assert_redirected_to portfolio_picture_path(assigns(:portfolio_picture))
  end

  test "should show portfolio_picture" do
    get :show, :id => portfolio_pictures(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => portfolio_pictures(:one).to_param
    assert_response :success
  end

  test "should update portfolio_picture" do
    put :update, :id => portfolio_pictures(:one).to_param, :portfolio_picture => { }
    assert_redirected_to portfolio_picture_path(assigns(:portfolio_picture))
  end

  test "should destroy portfolio_picture" do
    assert_difference('PortfolioPicture.count', -1) do
      delete :destroy, :id => portfolio_pictures(:one).to_param
    end

    assert_redirected_to portfolio_pictures_path
  end
end
