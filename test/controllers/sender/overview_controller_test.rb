# frozen_string_literal: true

require 'test_helper'

class OverviewControllerTest < ActionDispatch::IntegrationTest
  test '/send should respond with 200' do
    get '/send'
    assert_response :success
  end

  test 'email field should use query param' do
    get '/send?recipient=test@test.de'
    assert_response :success
    assert_select 'input[value=?]', 'test@test.de'
  end

  test 'email field should be empty without query param' do
    get '/send?foo=bar'
    assert_response :success
    assert_select 'input[value=?]', '', 0
  end
end
