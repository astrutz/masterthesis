# frozen_string_literal: true

require 'test_helper'

module Sender
  class CapacitiesControllerTest < ActionDispatch::IntegrationTest
    test 'should respond with 200' do
      get '/send/capacity'
      assert_response :success
    end
  end
end
