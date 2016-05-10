require 'test_helper'

class FormroutesControllerTest < ActionController::TestCase
  setup do
    @formroute = formroutes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:formroutes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create formroute" do
    assert_difference('Formroute.count') do
      post :create, formroute: { key: @formroute.key, name: @formroute.name, page: @formroute.page, user_id: @formroute.user_id }
    end

    assert_redirected_to formroute_path(assigns(:formroute))
  end

  test "should show formroute" do
    get :show, id: @formroute
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @formroute
    assert_response :success
  end

  test "should update formroute" do
    patch :update, id: @formroute, formroute: { key: @formroute.key, name: @formroute.name, page: @formroute.page, user_id: @formroute.user_id }
    assert_redirected_to formroute_path(assigns(:formroute))
  end

  test "should destroy formroute" do
    assert_difference('Formroute.count', -1) do
      delete :destroy, id: @formroute
    end

    assert_redirected_to formroutes_path
  end
end
