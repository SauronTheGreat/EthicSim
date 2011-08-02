require 'test_helper'

class PlayerAnswersControllerTest < ActionController::TestCase
  setup do
    @player_answer = player_answers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:player_answers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create player_answer" do
    assert_difference('PlayerAnswer.count') do
      post :create, :player_answer => @player_answer.attributes
    end

    assert_redirected_to player_answer_path(assigns(:player_answer))
  end

  test "should show player_answer" do
    get :show, :id => @player_answer.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @player_answer.to_param
    assert_response :success
  end

  test "should update player_answer" do
    put :update, :id => @player_answer.to_param, :player_answer => @player_answer.attributes
    assert_redirected_to player_answer_path(assigns(:player_answer))
  end

  test "should destroy player_answer" do
    assert_difference('PlayerAnswer.count', -1) do
      delete :destroy, :id => @player_answer.to_param
    end

    assert_redirected_to player_answers_path
  end
end
