# frozen_string_literal: true

require 'test_helper'

module Receive
  class SessionsControllerTest < ActionDispatch::IntegrationTest
    test 'should get /receive/login' do
      get '/receive/login'
      assert_response :success
    end

    test 'should login' do
      post '/receive/sessions', params: { username: recipients(:one).username, password: default_password }
      assert_response :redirect
      assert_redirected_to '/receive'
      assert_not_nil session[:recipient_id]
    end

    test 'should logout' do
      get '/receive/logout'
      assert_response :redirect
      assert_redirected_to '/'
      assert_nil session[:recipient_id]
    end

    test 'should not login with wrong credentials' do
      post '/receive/sessions', params: { username: 'foo', password: 'bar' }
      assert_response :redirect
      assert_redirected_to '/receive/login?error=true'
      assert_nil session[:recipient_id]
    end
  end
end
