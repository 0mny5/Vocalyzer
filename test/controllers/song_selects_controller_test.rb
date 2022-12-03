require "test_helper"

class SongSelectsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get song_selects_show_url
    assert_response :success
  end
end
