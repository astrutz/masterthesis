# frozen_string_literal: true

require 'test_helper'

module Sender
  class CapacitiesControllerTest < ActionDispatch::IntegrationTest
    test 'should respond with 200' do
      get '/send/capacity'
      assert_response :success
    end

    test 'should only show alert with more than 50 emails' do
      get '/send/capacity?mails=200'
      assert_response :success
      assert_select '.alert'

      get '/send/capacity?mails=10'
      assert_response :success
      assert_select '.alert', 0
    end

    test 'should show correct response date' do
      get '/send/capacity?mails=40&performance=7'
      assert_response :success
      assert_match I18n.l(6.days.from_now.to_date), response.body
    end
  end
end
