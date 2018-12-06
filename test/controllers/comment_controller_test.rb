require 'test_helper'

class CommentControllerTest < ActionDispatch::IntegrationTest
  test "should get content:text" do
    get comment_content:text_url
    assert_response :success
  end

end
