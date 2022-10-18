# frozen_string_literal: true

require 'test_helper'

module Receive
  class RecipientsControllerTest < ActionDispatch::IntegrationTest
    test 'should get /receive/signup' do
      get '/receive/signup'
      assert_response :success
    end

    test 'should sign up new recipients' do
      post '/receive/recipients',
           params: { username: 'foo', password: 'foobarbar', name: 'foo', editing_performance_per_day: 1, server: 'foo', port: 2, ssl: 'foo', auth_type: 'foo', email_address: 'foo@bar.com',
                     email_password: 'aa' }
      assert_response :redirect
      assert_redirected_to '/receive'
      assert_equal 6, Recipient.all.size
      assert_equal 3, Credential.all.size
      assert_equal 6, Inbox.all.size
      assert_equal 'foo', Recipient.last.username
      assert_equal 'foo@bar.com', Credential.last.username
    end

    test 'should not sign up without form data' do
      post '/receive/recipients'
      assert_response :redirect
      assert_redirected_to '/receive/signup?error=true'
      assert_equal 5, Recipient.all.size
      assert_equal 2, Credential.all.size
      assert_equal 5, Inbox.all.size
    end

    test 'should update editing performance per day' do
      post '/receive/sessions', params: { username: recipients(:one).username, password: default_password }
      patch "/receive/recipients/#{recipients(:one).id}", params: { recipient: { editing_performance_per_day: 2 } }
      assert_response :redirect
      assert_redirected_to '/receive'
    end
  end
end
