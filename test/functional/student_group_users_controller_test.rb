require 'test_helper'

class StudentGroupUsersControllerTest < ActionController::TestCase
  setup do
    @student_group_user = student_group_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:student_group_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create student_group_user" do
    assert_difference('StudentGroupUser.count') do
      post :create, :student_group_user => @student_group_user.attributes
    end

    assert_redirected_to student_group_user_path(assigns(:student_group_user))
  end

  test "should show student_group_user" do
    get :show, :id => @student_group_user.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @student_group_user.to_param
    assert_response :success
  end

  test "should update student_group_user" do
    put :update, :id => @student_group_user.to_param, :student_group_user => @student_group_user.attributes
    assert_redirected_to student_group_user_path(assigns(:student_group_user))
  end

  test "should destroy student_group_user" do
    assert_difference('StudentGroupUser.count', -1) do
      delete :destroy, :id => @student_group_user.to_param
    end

    assert_redirected_to student_group_users_path
  end
end
