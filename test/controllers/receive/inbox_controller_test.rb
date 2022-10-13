# frozen_string_literal: true

require 'test_helper'

module Receive
  class InboxControllerTest < ActionDispatch::IntegrationTest
    test 'should redirect to login' do
      get '/receive'
      assert_response :redirect
      assert_redirected_to '/receive/login'
    end

    test 'should get /receive when logged in' do
      post '/receive/sessions', params: { username: recipients(:one).username, password: default_password }
      get '/receive'
      assert_response :success
    end
  end
end
