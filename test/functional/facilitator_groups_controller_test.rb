require 'test_helper'

class FacilitatorGroupsControllerTest < ActionController::TestCase
  setup do
    @facilitator_group = facilitator_groups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:facilitator_groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create facilitator_group" do
    assert_difference('FacilitatorGroup.count') do
      post :create, :facilitator_group => @facilitator_group.attributes
    end

    assert_redirected_to facilitator_group_path(assigns(:facilitator_group))
  end

  test "should show facilitator_group" do
    get :show, :id => @facilitator_group.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @facilitator_group.to_param
    assert_response :success
  end

  test "should update facilitator_group" do
    put :update, :id => @facilitator_group.to_param, :facilitator_group => @facilitator_group.attributes
    assert_redirected_to facilitator_group_path(assigns(:facilitator_group))
  end

  test "should destroy facilitator_group" do
    assert_difference('FacilitatorGroup.count', -1) do
      delete :destroy, :id => @facilitator_group.to_param
    end

    assert_redirected_to facilitator_groups_path
  end
end
