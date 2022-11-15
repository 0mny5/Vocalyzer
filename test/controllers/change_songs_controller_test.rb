require "test_helper"

class ChangeSongsControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get change_songs_update_url
    assert_response :success
  end
end
