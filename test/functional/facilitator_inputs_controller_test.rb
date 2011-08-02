require 'test_helper'

class FacilitatorInputsControllerTest < ActionController::TestCase
  setup do
    @facilitator_input = facilitator_inputs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:facilitator_inputs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create facilitator_input" do
    assert_difference('FacilitatorInput.count') do
      post :create, :facilitator_input => @facilitator_input.attributes
    end

    assert_redirected_to facilitator_input_path(assigns(:facilitator_input))
  end

  test "should show facilitator_input" do
    get :show, :id => @facilitator_input.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @facilitator_input.to_param
    assert_response :success
  end

  test "should update facilitator_input" do
    put :update, :id => @facilitator_input.to_param, :facilitator_input => @facilitator_input.attributes
    assert_redirected_to facilitator_input_path(assigns(:facilitator_input))
  end

  test "should destroy facilitator_input" do
    assert_difference('FacilitatorInput.count', -1) do
      delete :destroy, :id => @facilitator_input.to_param
    end

    assert_redirected_to facilitator_inputs_path
  end
end
