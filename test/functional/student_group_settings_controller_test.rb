require 'test_helper'

class StudentGroupSettingsControllerTest < ActionController::TestCase
  setup do
    @student_group_setting = student_group_settings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:student_group_settings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create student_group_setting" do
    assert_difference('StudentGroupSetting.count') do
      post :create, :student_group_setting => @student_group_setting.attributes
    end

    assert_redirected_to student_group_setting_path(assigns(:student_group_setting))
  end

  test "should show student_group_setting" do
    get :show, :id => @student_group_setting.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @student_group_setting.to_param
    assert_response :success
  end

  test "should update student_group_setting" do
    put :update, :id => @student_group_setting.to_param, :student_group_setting => @student_group_setting.attributes
    assert_redirected_to student_group_setting_path(assigns(:student_group_setting))
  end

  test "should destroy student_group_setting" do
    assert_difference('StudentGroupSetting.count', -1) do
      delete :destroy, :id => @student_group_setting.to_param
    end

    assert_redirected_to student_group_settings_path
  end
end
