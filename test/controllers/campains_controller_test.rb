require "test_helper"

class CampainsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get campains_show_url
    assert_response :success
  end
end
