# frozen_string_literal: true

require 'test_helper'

module Send
  class CapacitiesControllerTest < ActionDispatch::IntegrationTest
    test '/send/capacity should respond with 200' do
      recipient_address = recipients(:one).email_address
      get "/send/capacity?recipient=#{recipient_address}&fetch=false"
      assert_response :success
    end

    test 'should only show alert with more than 50 emails' do
      recipient = recipients(:one)
      get "/send/capacity?recipient=#{recipient.email_address}&fetch=false"
      assert_response :success
      assert_select '.alert', 0
    end

    test 'should show correct target date' do
      recipient = recipients(:one)
      get "/send/capacity?recipient=#{recipient.email_address}&fetch=false"
      assert_response :success
      assert_match I18n.l(3.days.from_now.to_date), response.body
    end

    test 'should show recipient not found' do
      get '/send/capacity?recipient=foobar&fetch=false'
      assert_response :not_found
      assert_select '.capacities__not_found .alert', 1
    end
  end
end
