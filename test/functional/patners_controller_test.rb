require 'test_helper'

class PatnersControllerTest < ActionController::TestCase
  setup do
    @patner = patners(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:patners)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create patner" do
    assert_difference('Patner.count') do
      post :create, :patner => @patner.attributes
    end

    assert_redirected_to patner_path(assigns(:patner))
  end

  test "should show patner" do
    get :show, :id => @patner
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @patner
    assert_response :success
  end

  test "should update patner" do
    put :update, :id => @patner, :patner => @patner.attributes
    assert_redirected_to patner_path(assigns(:patner))
  end

  test "should destroy patner" do
    assert_difference('Patner.count', -1) do
      delete :destroy, :id => @patner
    end

    assert_redirected_to patners_path
  end
end
