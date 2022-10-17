# frozen_string_literal: true

require 'test_helper'

module Receive
  class MessagesControllerTest < ActionDispatch::IntegrationTest
    test 'should show message' do
      post '/receive/sessions', params: { username: recipients(:one).username, password: default_password }
      get "/receive/messages/#{messages(:one).id}"
      assert_response :success
    end

    test 'should redirect to login' do
      get "/receive/messages/#{messages(:one).id}"
      assert_response :redirect
      assert_redirected_to '/receive/login'
    end

    test 'should destroy message' do
      post '/receive/sessions', params: { username: recipients(:one).username, password: default_password }
      get "/receive/message/#{messages(:one).id}/delete?fetch=false"
      assert_response :redirect
      assert_redirected_to '/receive'
    end
  end
end
