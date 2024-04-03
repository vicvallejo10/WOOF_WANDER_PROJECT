require "test_helper"

class FilterOptionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get filter_options_index_url
    assert_response :success
  end
end
