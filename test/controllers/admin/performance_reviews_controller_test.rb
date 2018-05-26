require 'test_helper'

class Admin::PerformanceReviewsControllerTest < ActionDispatch::IntegrationTest
  test "should get ." do
    get admin_performance_reviews_._url
    assert_response :success
  end

end
