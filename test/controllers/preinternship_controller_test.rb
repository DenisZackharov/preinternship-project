require "test_helper"

class PreinternshipControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get preinternship_home_url
    assert_response :success
  end

  test "should get about" do
    get preinternship_about_url
    assert_response :success
  end
end
