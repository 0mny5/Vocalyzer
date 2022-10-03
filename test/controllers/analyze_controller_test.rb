require "test_helper"

class AnalyzeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get analyze_index_url
    assert_response :success
  end

  test "should get shoew" do
    get analyze_shoew_url
    assert_response :success
  end
end
