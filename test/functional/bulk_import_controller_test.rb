require 'test_helper'

class BulkImportControllerTest < ActionController::TestCase
  test "should get import" do
    get :import
    assert_response :success
  end

end
