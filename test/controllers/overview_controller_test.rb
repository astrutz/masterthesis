require "test_helper"

class OverviewControllerTest < ActionDispatch::IntegrationTest
  test 'should respond with 200' do
    get '/'
    assert_response :success
  end
end
