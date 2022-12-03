require "test_helper"

class SongSearchesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get song_searches_index_url
    assert_response :success
  end
end
