require 'test_helper'

class MessagesControllerTest < ActionController::TestCase
  setup do
    @message = messages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:messages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create message" do
    assert_difference('Message.count') do
      post :create, message: { fwd_msg_to: @message.fwd_msg_to, msg: @message.msg, msg_from_email: @message.msg_from_email, msg_from_ipaddress: @message.msg_from_ipaddress, msg_from_name: @message.msg_from_name, msg_from_site: @message.msg_from_site, msg_subject: @message.msg_subject }
    end

    assert_redirected_to message_path(assigns(:message))
  end

  test "should show message" do
    get :show, id: @message
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @message
    assert_response :success
  end

  test "should update message" do
    patch :update, id: @message, message: { fwd_msg_to: @message.fwd_msg_to, msg: @message.msg, msg_from_email: @message.msg_from_email, msg_from_ipaddress: @message.msg_from_ipaddress, msg_from_name: @message.msg_from_name, msg_from_site: @message.msg_from_site, msg_subject: @message.msg_subject }
    assert_redirected_to message_path(assigns(:message))
  end

  test "should destroy message" do
    assert_difference('Message.count', -1) do
      delete :destroy, id: @message
    end

    assert_redirected_to messages_path
  end
end
